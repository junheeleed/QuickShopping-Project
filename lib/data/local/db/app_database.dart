import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:quick_shopping/data/local/db/tables/auth_accounts.dart';

part 'app_database.g.dart';



class Apps extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get shortDesc => text().withDefault(const Constant(''))();
  TextColumn get description => text().withDefault(const Constant(''))();

  TextColumn get url => text()();

  TextColumn get imageUrl => text()();

  IntColumn get price => integer().withDefault(const Constant(0))();
  IntColumn get shippingFee => integer().withDefault(const Constant(0))();

  TextColumn get savingInfo => text().nullable()();
  TextColumn get benefitInfo => text().nullable()();
  TextColumn get shippingInfo => text().nullable()();

  TextColumn get storeName => text().withDefault(const Constant(''))();
  TextColumn get siteType => text().withDefault(const Constant(''))();

  BoolColumn get installed => boolean().withDefault(const Constant(false))();

  TextColumn get manufacturer => text().nullable()();
  TextColumn get brand => text().nullable()();
  TextColumn get modelName => text().nullable()();
  TextColumn get origin => text().nullable()();
  TextColumn get detailFeatures => text().nullable()();
  TextColumn get productForm => text().nullable()();
  TextColumn get capacity => text().nullable()();
  TextColumn get keyFeatures => text().nullable()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Categories extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class AppCategoryJoins extends Table {
  IntColumn get appId => integer().references(Apps, #id)();
  IntColumn get categoryId => integer().references(Categories, #id)();

  @override
  Set<Column> get primaryKey => {appId, categoryId};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'portfolio_store.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [
  Apps,
  Categories,
  AppCategoryJoins,
  HomeBanners,
  RecentSearches,
  AuthProfiles,
  AuthAccounts
], daos: [
  StoreDao,
  HomeBannerDao,
  RecentSearchDao,
  AuthDao
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => await m.createAll(),
  );
}

class AppListRow {
  final App app;
  AppListRow(this.app);
}

class AppDetailRow {
  final App product;
  final List<Category> categories;
  AppDetailRow(this.product, this.categories);
}

@DriftAccessor(tables: [Apps, Categories, AppCategoryJoins])
class StoreDao extends DatabaseAccessor<AppDatabase> with _$StoreDaoMixin {
  StoreDao(super.db);

  Stream<List<Category>> watchCategories() {
    return (select(categories)..orderBy([(t) => OrderingTerm.asc(t.id)])).watch();
  }

  Stream<List<App>> watchProducts({int? categoryId}) {
    if (categoryId == null || categoryId == 0) {
      final base = select(apps)
        ..orderBy([
              (t) => OrderingTerm.desc(t.updatedAt),
              (t) => OrderingTerm.desc(t.installed),
              (t) => OrderingTerm.asc(t.name),
        ]);

      return base.watch();
    }

    final joinQuery = select(apps).join([
      innerJoin(appCategoryJoins, appCategoryJoins.appId.equalsExp(apps.id)),
    ])
      ..where(appCategoryJoins.categoryId.equals(categoryId))
      ..orderBy([
        OrderingTerm.desc(apps.updatedAt),
        OrderingTerm.desc(apps.installed),
        OrderingTerm.asc(apps.name),
      ]);

    return joinQuery.watch().map((rows) {
      return rows.map((r) => r.readTable(apps)).toList();
    });
  }

  Stream<List<App>> searchProducts(String query) {
    final q = query.trim();
    if (q.isEmpty) return watchProducts();

    final pattern = '%$q%';

    final sel = select(apps)
      ..where((t) =>
      t.name.like(pattern) |
      t.shortDesc.like(pattern) |
      t.storeName.like(pattern) |
      t.siteType.like(pattern))
      ..orderBy([
            (t) => OrderingTerm.desc(t.updatedAt),
            (t) => OrderingTerm.desc(t.installed),
            (t) => OrderingTerm.asc(t.name),
      ]);

    return sel.watch();
  }

  Stream<AppDetailRow> watchProductDetail(int appId) {
    final joinQuery = select(apps).join([
      leftOuterJoin(appCategoryJoins, appCategoryJoins.appId.equalsExp(apps.id)),
      leftOuterJoin(categories, categories.id.equalsExp(appCategoryJoins.categoryId)),
    ])
      ..where(apps.id.equals(appId));

    return joinQuery.watch().map((rows) {
      if (rows.isEmpty) throw StateError('App not found: $appId');
      final app = rows.first.readTable(apps);
      final cats = rows
          .map((r) => r.readTableOrNull(categories))
          .whereType<Category>()
          .toSet()
          .toList()
        ..sort((a, b) => a.id.compareTo(b.id));
      return AppDetailRow(app, cats);
    });
  }

  Future<void> setInstalled(int appId, bool installed) {
    return (update(apps)..where((t) => t.id.equals(appId))).write(
      AppsCompanion(installed: Value(installed), updatedAt: Value(DateTime.now())),
    );
  }

  Future<void> replaceAll({
    required List<AppsCompanion> newProducts,
    required List<CategoriesCompanion> newCategories,
    required List<AppCategoryJoinsCompanion> newJoins,
  }) async {
    await transaction(() async {
      await delete(appCategoryJoins).go();
      await delete(apps).go();
      await delete(categories).go();

      await batch((b) {
        b.insertAll(categories, newCategories, mode: InsertMode.insertOrReplace);
        b.insertAll(apps, newProducts, mode: InsertMode.insertOrReplace);
        b.insertAll(appCategoryJoins, newJoins, mode: InsertMode.insertOrReplace);
      });
    });
  }

  String toScreenshotsJson(List<String> list) => jsonEncode(list);

  Future<Map<int, bool>> getInstalledMap() async {
    final rows = await select(apps).get();
    return {for (final a in rows) a.id: a.installed};
  }

  Stream<List<App>> watchSearch(String keyword) {
    final q = keyword.trim();
    if (q.isEmpty) return Stream.value(const []);

    final like = '%$q%';

    final query = (select(apps)
      ..where((t) =>
      t.name.like(like) |
      t.shortDesc.like(like) |
      t.description.like(like))
      ..orderBy([
            (t) => OrderingTerm.desc(t.id),
      ]));

    return query.watch();
  }
}

class HomeBanners extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get subtitle => text()();
  TextColumn get targetUrl => text()();
  TextColumn get imageUrl => text().nullable()();
  IntColumn get gradA => integer()();
  IntColumn get gradB => integer()();
  IntColumn get sortOrder => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftAccessor(tables: [HomeBanners])
class HomeBannerDao extends DatabaseAccessor<AppDatabase>
    with _$HomeBannerDaoMixin {
  HomeBannerDao(AppDatabase db) : super(db);

  Stream<List<HomeBanner>> watchBanners() {
    final q = select(homeBanners)
      ..orderBy([(t) => OrderingTerm(expression: t.sortOrder)]);
    return q.watch();
  }

  Future<List<HomeBanner>> getOnce() {
    final q = select(homeBanners)
      ..orderBy([(t) => OrderingTerm(expression: t.sortOrder)]);
    return q.get();
  }

  Future<void> upsertAll(List<HomeBannersCompanion> items) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(homeBanners, items);
    });
  }

  Future<void> updateImageUrl(int id, String imageUrl) {
    return (update(homeBanners)..where((t) => t.id.equals(id))).write(
      HomeBannersCompanion(imageUrl: Value(imageUrl)),
    );
  }
}

class RecentSearches extends Table {
  TextColumn get keyword => text()();
  DateTimeColumn get searchedAt => dateTime()();

  @override
  Set<Column> get primaryKey => { keyword };
}

@DriftAccessor(tables: [RecentSearches])
class RecentSearchDao extends DatabaseAccessor<AppDatabase>
    with _$RecentSearchDaoMixin {
  RecentSearchDao(AppDatabase db) : super(db);

  Stream<List<RecentSearche>> watchRecent() {
    return (select(recentSearches)
      ..orderBy([(t) => OrderingTerm.desc(t.searchedAt)]))
        .watch();
  }

  Future<void> upsertKeyword(String keyword) async {
    final k = keyword.trim();
    if (k.isEmpty) return;

    await into(recentSearches).insert(
      RecentSearchesCompanion.insert(
        keyword: k,
        searchedAt: DateTime.now(),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> deleteKeyword(String keyword) {
    return (delete(recentSearches)..where((t) => t.keyword.equals(keyword))).go();
  }

  Future<void> clearAll() => delete(recentSearches).go();
}

class AuthProfiles extends Table {
  IntColumn get id => integer()();
  BoolColumn get isLoggedIn => boolean().withDefault(const Constant(false))();

  TextColumn get nickname => text().nullable()();
  TextColumn get email => text().nullable()();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftAccessor(tables: [AuthProfiles, AuthAccounts])
class AuthDao extends DatabaseAccessor<AppDatabase> with _$AuthDaoMixin {
  AuthDao(super.db);

  static const int meId = 1;

  Stream<AuthProfile?> watchProfile() {
    return (select(authProfiles)..where((t) => t.id.equals(meId)))
        .watch()
        .map((rows) => rows.isEmpty ? null : rows.first);
  }

  Future<void> upsertLoggedIn({
    required String email,
  }) async {
    final nickname = _nicknameFromEmail(email);

    await into(authProfiles).insertOnConflictUpdate(
      AuthProfilesCompanion(
        id: const Value(meId),
        isLoggedIn: const Value(true),
        nickname: Value(nickname),
        email: Value(email),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> upsertLoggedOut() async {
    await into(authProfiles).insertOnConflictUpdate(
      AuthProfilesCompanion(
        id: const Value(meId),
        isLoggedIn: const Value(false),
        nickname: const Value(null),
        email: const Value(null),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    final e = email.trim();
    final p = password.trim();

    await into(authAccounts).insert(
      AuthAccountsCompanion.insert(email: e, password: p),
    );
  }

  Future<bool> verifyAccount({
    required String email,
    required String password,
  }) async {
    final e = email.trim();
    final p = password.trim();

    final row = await (select(authAccounts)..where((t) => t.email.equals(e)))
        .getSingleOrNull();

    if (row == null) return false;
    return row.password == p;
  }

  String _nicknameFromEmail(String email) {
    final idx = email.indexOf('@');
    return (idx > 0) ? email.substring(0, idx) : email;
  }

  Future<AuthAccount?> findAccountByEmail(String email) {
    final e = email.trim();
    return (select(authAccounts)..where((t) => t.email.equals(e)))
        .getSingleOrNull();
  }
}
