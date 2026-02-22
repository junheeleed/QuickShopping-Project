// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AppsTable extends Apps with TableInfo<$AppsTable, App> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shortDescMeta = const VerificationMeta(
    'shortDesc',
  );
  @override
  late final GeneratedColumn<String> shortDesc = GeneratedColumn<String>(
    'short_desc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _shippingFeeMeta = const VerificationMeta(
    'shippingFee',
  );
  @override
  late final GeneratedColumn<int> shippingFee = GeneratedColumn<int>(
    'shipping_fee',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _savingInfoMeta = const VerificationMeta(
    'savingInfo',
  );
  @override
  late final GeneratedColumn<String> savingInfo = GeneratedColumn<String>(
    'saving_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _benefitInfoMeta = const VerificationMeta(
    'benefitInfo',
  );
  @override
  late final GeneratedColumn<String> benefitInfo = GeneratedColumn<String>(
    'benefit_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shippingInfoMeta = const VerificationMeta(
    'shippingInfo',
  );
  @override
  late final GeneratedColumn<String> shippingInfo = GeneratedColumn<String>(
    'shipping_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _storeNameMeta = const VerificationMeta(
    'storeName',
  );
  @override
  late final GeneratedColumn<String> storeName = GeneratedColumn<String>(
    'store_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _siteTypeMeta = const VerificationMeta(
    'siteType',
  );
  @override
  late final GeneratedColumn<String> siteType = GeneratedColumn<String>(
    'site_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _installedMeta = const VerificationMeta(
    'installed',
  );
  @override
  late final GeneratedColumn<bool> installed = GeneratedColumn<bool>(
    'installed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("installed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _manufacturerMeta = const VerificationMeta(
    'manufacturer',
  );
  @override
  late final GeneratedColumn<String> manufacturer = GeneratedColumn<String>(
    'manufacturer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modelNameMeta = const VerificationMeta(
    'modelName',
  );
  @override
  late final GeneratedColumn<String> modelName = GeneratedColumn<String>(
    'model_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _detailFeaturesMeta = const VerificationMeta(
    'detailFeatures',
  );
  @override
  late final GeneratedColumn<String> detailFeatures = GeneratedColumn<String>(
    'detail_features',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productFormMeta = const VerificationMeta(
    'productForm',
  );
  @override
  late final GeneratedColumn<String> productForm = GeneratedColumn<String>(
    'product_form',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _capacityMeta = const VerificationMeta(
    'capacity',
  );
  @override
  late final GeneratedColumn<String> capacity = GeneratedColumn<String>(
    'capacity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _keyFeaturesMeta = const VerificationMeta(
    'keyFeatures',
  );
  @override
  late final GeneratedColumn<String> keyFeatures = GeneratedColumn<String>(
    'key_features',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    shortDesc,
    description,
    url,
    imageUrl,
    price,
    shippingFee,
    savingInfo,
    benefitInfo,
    shippingInfo,
    storeName,
    siteType,
    installed,
    manufacturer,
    brand,
    modelName,
    origin,
    detailFeatures,
    productForm,
    capacity,
    keyFeatures,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'apps';
  @override
  VerificationContext validateIntegrity(
    Insertable<App> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_desc')) {
      context.handle(
        _shortDescMeta,
        shortDesc.isAcceptableOrUnknown(data['short_desc']!, _shortDescMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('shipping_fee')) {
      context.handle(
        _shippingFeeMeta,
        shippingFee.isAcceptableOrUnknown(
          data['shipping_fee']!,
          _shippingFeeMeta,
        ),
      );
    }
    if (data.containsKey('saving_info')) {
      context.handle(
        _savingInfoMeta,
        savingInfo.isAcceptableOrUnknown(data['saving_info']!, _savingInfoMeta),
      );
    }
    if (data.containsKey('benefit_info')) {
      context.handle(
        _benefitInfoMeta,
        benefitInfo.isAcceptableOrUnknown(
          data['benefit_info']!,
          _benefitInfoMeta,
        ),
      );
    }
    if (data.containsKey('shipping_info')) {
      context.handle(
        _shippingInfoMeta,
        shippingInfo.isAcceptableOrUnknown(
          data['shipping_info']!,
          _shippingInfoMeta,
        ),
      );
    }
    if (data.containsKey('store_name')) {
      context.handle(
        _storeNameMeta,
        storeName.isAcceptableOrUnknown(data['store_name']!, _storeNameMeta),
      );
    }
    if (data.containsKey('site_type')) {
      context.handle(
        _siteTypeMeta,
        siteType.isAcceptableOrUnknown(data['site_type']!, _siteTypeMeta),
      );
    }
    if (data.containsKey('installed')) {
      context.handle(
        _installedMeta,
        installed.isAcceptableOrUnknown(data['installed']!, _installedMeta),
      );
    }
    if (data.containsKey('manufacturer')) {
      context.handle(
        _manufacturerMeta,
        manufacturer.isAcceptableOrUnknown(
          data['manufacturer']!,
          _manufacturerMeta,
        ),
      );
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('model_name')) {
      context.handle(
        _modelNameMeta,
        modelName.isAcceptableOrUnknown(data['model_name']!, _modelNameMeta),
      );
    }
    if (data.containsKey('origin')) {
      context.handle(
        _originMeta,
        origin.isAcceptableOrUnknown(data['origin']!, _originMeta),
      );
    }
    if (data.containsKey('detail_features')) {
      context.handle(
        _detailFeaturesMeta,
        detailFeatures.isAcceptableOrUnknown(
          data['detail_features']!,
          _detailFeaturesMeta,
        ),
      );
    }
    if (data.containsKey('product_form')) {
      context.handle(
        _productFormMeta,
        productForm.isAcceptableOrUnknown(
          data['product_form']!,
          _productFormMeta,
        ),
      );
    }
    if (data.containsKey('capacity')) {
      context.handle(
        _capacityMeta,
        capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta),
      );
    }
    if (data.containsKey('key_features')) {
      context.handle(
        _keyFeaturesMeta,
        keyFeatures.isAcceptableOrUnknown(
          data['key_features']!,
          _keyFeaturesMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  App map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return App(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      shortDesc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_desc'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      shippingFee: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shipping_fee'],
      )!,
      savingInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}saving_info'],
      ),
      benefitInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}benefit_info'],
      ),
      shippingInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipping_info'],
      ),
      storeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}store_name'],
      )!,
      siteType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}site_type'],
      )!,
      installed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}installed'],
      )!,
      manufacturer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manufacturer'],
      ),
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      modelName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_name'],
      ),
      origin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin'],
      ),
      detailFeatures: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detail_features'],
      ),
      productForm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_form'],
      ),
      capacity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}capacity'],
      ),
      keyFeatures: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key_features'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppsTable createAlias(String alias) {
    return $AppsTable(attachedDatabase, alias);
  }
}

class App extends DataClass implements Insertable<App> {
  final int id;
  final String name;
  final String shortDesc;
  final String description;
  final String url;
  final String imageUrl;
  final int price;
  final int shippingFee;
  final String? savingInfo;
  final String? benefitInfo;
  final String? shippingInfo;
  final String storeName;
  final String siteType;
  final bool installed;
  final String? manufacturer;
  final String? brand;
  final String? modelName;
  final String? origin;
  final String? detailFeatures;
  final String? productForm;
  final String? capacity;
  final String? keyFeatures;
  final DateTime updatedAt;
  const App({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.price,
    required this.shippingFee,
    this.savingInfo,
    this.benefitInfo,
    this.shippingInfo,
    required this.storeName,
    required this.siteType,
    required this.installed,
    this.manufacturer,
    this.brand,
    this.modelName,
    this.origin,
    this.detailFeatures,
    this.productForm,
    this.capacity,
    this.keyFeatures,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['short_desc'] = Variable<String>(shortDesc);
    map['description'] = Variable<String>(description);
    map['url'] = Variable<String>(url);
    map['image_url'] = Variable<String>(imageUrl);
    map['price'] = Variable<int>(price);
    map['shipping_fee'] = Variable<int>(shippingFee);
    if (!nullToAbsent || savingInfo != null) {
      map['saving_info'] = Variable<String>(savingInfo);
    }
    if (!nullToAbsent || benefitInfo != null) {
      map['benefit_info'] = Variable<String>(benefitInfo);
    }
    if (!nullToAbsent || shippingInfo != null) {
      map['shipping_info'] = Variable<String>(shippingInfo);
    }
    map['store_name'] = Variable<String>(storeName);
    map['site_type'] = Variable<String>(siteType);
    map['installed'] = Variable<bool>(installed);
    if (!nullToAbsent || manufacturer != null) {
      map['manufacturer'] = Variable<String>(manufacturer);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || modelName != null) {
      map['model_name'] = Variable<String>(modelName);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || detailFeatures != null) {
      map['detail_features'] = Variable<String>(detailFeatures);
    }
    if (!nullToAbsent || productForm != null) {
      map['product_form'] = Variable<String>(productForm);
    }
    if (!nullToAbsent || capacity != null) {
      map['capacity'] = Variable<String>(capacity);
    }
    if (!nullToAbsent || keyFeatures != null) {
      map['key_features'] = Variable<String>(keyFeatures);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppsCompanion toCompanion(bool nullToAbsent) {
    return AppsCompanion(
      id: Value(id),
      name: Value(name),
      shortDesc: Value(shortDesc),
      description: Value(description),
      url: Value(url),
      imageUrl: Value(imageUrl),
      price: Value(price),
      shippingFee: Value(shippingFee),
      savingInfo: savingInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(savingInfo),
      benefitInfo: benefitInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(benefitInfo),
      shippingInfo: shippingInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingInfo),
      storeName: Value(storeName),
      siteType: Value(siteType),
      installed: Value(installed),
      manufacturer: manufacturer == null && nullToAbsent
          ? const Value.absent()
          : Value(manufacturer),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      modelName: modelName == null && nullToAbsent
          ? const Value.absent()
          : Value(modelName),
      origin: origin == null && nullToAbsent
          ? const Value.absent()
          : Value(origin),
      detailFeatures: detailFeatures == null && nullToAbsent
          ? const Value.absent()
          : Value(detailFeatures),
      productForm: productForm == null && nullToAbsent
          ? const Value.absent()
          : Value(productForm),
      capacity: capacity == null && nullToAbsent
          ? const Value.absent()
          : Value(capacity),
      keyFeatures: keyFeatures == null && nullToAbsent
          ? const Value.absent()
          : Value(keyFeatures),
      updatedAt: Value(updatedAt),
    );
  }

  factory App.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return App(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      shortDesc: serializer.fromJson<String>(json['shortDesc']),
      description: serializer.fromJson<String>(json['description']),
      url: serializer.fromJson<String>(json['url']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      price: serializer.fromJson<int>(json['price']),
      shippingFee: serializer.fromJson<int>(json['shippingFee']),
      savingInfo: serializer.fromJson<String?>(json['savingInfo']),
      benefitInfo: serializer.fromJson<String?>(json['benefitInfo']),
      shippingInfo: serializer.fromJson<String?>(json['shippingInfo']),
      storeName: serializer.fromJson<String>(json['storeName']),
      siteType: serializer.fromJson<String>(json['siteType']),
      installed: serializer.fromJson<bool>(json['installed']),
      manufacturer: serializer.fromJson<String?>(json['manufacturer']),
      brand: serializer.fromJson<String?>(json['brand']),
      modelName: serializer.fromJson<String?>(json['modelName']),
      origin: serializer.fromJson<String?>(json['origin']),
      detailFeatures: serializer.fromJson<String?>(json['detailFeatures']),
      productForm: serializer.fromJson<String?>(json['productForm']),
      capacity: serializer.fromJson<String?>(json['capacity']),
      keyFeatures: serializer.fromJson<String?>(json['keyFeatures']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'shortDesc': serializer.toJson<String>(shortDesc),
      'description': serializer.toJson<String>(description),
      'url': serializer.toJson<String>(url),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'price': serializer.toJson<int>(price),
      'shippingFee': serializer.toJson<int>(shippingFee),
      'savingInfo': serializer.toJson<String?>(savingInfo),
      'benefitInfo': serializer.toJson<String?>(benefitInfo),
      'shippingInfo': serializer.toJson<String?>(shippingInfo),
      'storeName': serializer.toJson<String>(storeName),
      'siteType': serializer.toJson<String>(siteType),
      'installed': serializer.toJson<bool>(installed),
      'manufacturer': serializer.toJson<String?>(manufacturer),
      'brand': serializer.toJson<String?>(brand),
      'modelName': serializer.toJson<String?>(modelName),
      'origin': serializer.toJson<String?>(origin),
      'detailFeatures': serializer.toJson<String?>(detailFeatures),
      'productForm': serializer.toJson<String?>(productForm),
      'capacity': serializer.toJson<String?>(capacity),
      'keyFeatures': serializer.toJson<String?>(keyFeatures),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  App copyWith({
    int? id,
    String? name,
    String? shortDesc,
    String? description,
    String? url,
    String? imageUrl,
    int? price,
    int? shippingFee,
    Value<String?> savingInfo = const Value.absent(),
    Value<String?> benefitInfo = const Value.absent(),
    Value<String?> shippingInfo = const Value.absent(),
    String? storeName,
    String? siteType,
    bool? installed,
    Value<String?> manufacturer = const Value.absent(),
    Value<String?> brand = const Value.absent(),
    Value<String?> modelName = const Value.absent(),
    Value<String?> origin = const Value.absent(),
    Value<String?> detailFeatures = const Value.absent(),
    Value<String?> productForm = const Value.absent(),
    Value<String?> capacity = const Value.absent(),
    Value<String?> keyFeatures = const Value.absent(),
    DateTime? updatedAt,
  }) => App(
    id: id ?? this.id,
    name: name ?? this.name,
    shortDesc: shortDesc ?? this.shortDesc,
    description: description ?? this.description,
    url: url ?? this.url,
    imageUrl: imageUrl ?? this.imageUrl,
    price: price ?? this.price,
    shippingFee: shippingFee ?? this.shippingFee,
    savingInfo: savingInfo.present ? savingInfo.value : this.savingInfo,
    benefitInfo: benefitInfo.present ? benefitInfo.value : this.benefitInfo,
    shippingInfo: shippingInfo.present ? shippingInfo.value : this.shippingInfo,
    storeName: storeName ?? this.storeName,
    siteType: siteType ?? this.siteType,
    installed: installed ?? this.installed,
    manufacturer: manufacturer.present ? manufacturer.value : this.manufacturer,
    brand: brand.present ? brand.value : this.brand,
    modelName: modelName.present ? modelName.value : this.modelName,
    origin: origin.present ? origin.value : this.origin,
    detailFeatures: detailFeatures.present
        ? detailFeatures.value
        : this.detailFeatures,
    productForm: productForm.present ? productForm.value : this.productForm,
    capacity: capacity.present ? capacity.value : this.capacity,
    keyFeatures: keyFeatures.present ? keyFeatures.value : this.keyFeatures,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  App copyWithCompanion(AppsCompanion data) {
    return App(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      shortDesc: data.shortDesc.present ? data.shortDesc.value : this.shortDesc,
      description: data.description.present
          ? data.description.value
          : this.description,
      url: data.url.present ? data.url.value : this.url,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      price: data.price.present ? data.price.value : this.price,
      shippingFee: data.shippingFee.present
          ? data.shippingFee.value
          : this.shippingFee,
      savingInfo: data.savingInfo.present
          ? data.savingInfo.value
          : this.savingInfo,
      benefitInfo: data.benefitInfo.present
          ? data.benefitInfo.value
          : this.benefitInfo,
      shippingInfo: data.shippingInfo.present
          ? data.shippingInfo.value
          : this.shippingInfo,
      storeName: data.storeName.present ? data.storeName.value : this.storeName,
      siteType: data.siteType.present ? data.siteType.value : this.siteType,
      installed: data.installed.present ? data.installed.value : this.installed,
      manufacturer: data.manufacturer.present
          ? data.manufacturer.value
          : this.manufacturer,
      brand: data.brand.present ? data.brand.value : this.brand,
      modelName: data.modelName.present ? data.modelName.value : this.modelName,
      origin: data.origin.present ? data.origin.value : this.origin,
      detailFeatures: data.detailFeatures.present
          ? data.detailFeatures.value
          : this.detailFeatures,
      productForm: data.productForm.present
          ? data.productForm.value
          : this.productForm,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      keyFeatures: data.keyFeatures.present
          ? data.keyFeatures.value
          : this.keyFeatures,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('App(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortDesc: $shortDesc, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('price: $price, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('savingInfo: $savingInfo, ')
          ..write('benefitInfo: $benefitInfo, ')
          ..write('shippingInfo: $shippingInfo, ')
          ..write('storeName: $storeName, ')
          ..write('siteType: $siteType, ')
          ..write('installed: $installed, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('brand: $brand, ')
          ..write('modelName: $modelName, ')
          ..write('origin: $origin, ')
          ..write('detailFeatures: $detailFeatures, ')
          ..write('productForm: $productForm, ')
          ..write('capacity: $capacity, ')
          ..write('keyFeatures: $keyFeatures, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    shortDesc,
    description,
    url,
    imageUrl,
    price,
    shippingFee,
    savingInfo,
    benefitInfo,
    shippingInfo,
    storeName,
    siteType,
    installed,
    manufacturer,
    brand,
    modelName,
    origin,
    detailFeatures,
    productForm,
    capacity,
    keyFeatures,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is App &&
          other.id == this.id &&
          other.name == this.name &&
          other.shortDesc == this.shortDesc &&
          other.description == this.description &&
          other.url == this.url &&
          other.imageUrl == this.imageUrl &&
          other.price == this.price &&
          other.shippingFee == this.shippingFee &&
          other.savingInfo == this.savingInfo &&
          other.benefitInfo == this.benefitInfo &&
          other.shippingInfo == this.shippingInfo &&
          other.storeName == this.storeName &&
          other.siteType == this.siteType &&
          other.installed == this.installed &&
          other.manufacturer == this.manufacturer &&
          other.brand == this.brand &&
          other.modelName == this.modelName &&
          other.origin == this.origin &&
          other.detailFeatures == this.detailFeatures &&
          other.productForm == this.productForm &&
          other.capacity == this.capacity &&
          other.keyFeatures == this.keyFeatures &&
          other.updatedAt == this.updatedAt);
}

class AppsCompanion extends UpdateCompanion<App> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> shortDesc;
  final Value<String> description;
  final Value<String> url;
  final Value<String> imageUrl;
  final Value<int> price;
  final Value<int> shippingFee;
  final Value<String?> savingInfo;
  final Value<String?> benefitInfo;
  final Value<String?> shippingInfo;
  final Value<String> storeName;
  final Value<String> siteType;
  final Value<bool> installed;
  final Value<String?> manufacturer;
  final Value<String?> brand;
  final Value<String?> modelName;
  final Value<String?> origin;
  final Value<String?> detailFeatures;
  final Value<String?> productForm;
  final Value<String?> capacity;
  final Value<String?> keyFeatures;
  final Value<DateTime> updatedAt;
  const AppsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.shortDesc = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.price = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.savingInfo = const Value.absent(),
    this.benefitInfo = const Value.absent(),
    this.shippingInfo = const Value.absent(),
    this.storeName = const Value.absent(),
    this.siteType = const Value.absent(),
    this.installed = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.brand = const Value.absent(),
    this.modelName = const Value.absent(),
    this.origin = const Value.absent(),
    this.detailFeatures = const Value.absent(),
    this.productForm = const Value.absent(),
    this.capacity = const Value.absent(),
    this.keyFeatures = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AppsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.shortDesc = const Value.absent(),
    this.description = const Value.absent(),
    required String url,
    required String imageUrl,
    this.price = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.savingInfo = const Value.absent(),
    this.benefitInfo = const Value.absent(),
    this.shippingInfo = const Value.absent(),
    this.storeName = const Value.absent(),
    this.siteType = const Value.absent(),
    this.installed = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.brand = const Value.absent(),
    this.modelName = const Value.absent(),
    this.origin = const Value.absent(),
    this.detailFeatures = const Value.absent(),
    this.productForm = const Value.absent(),
    this.capacity = const Value.absent(),
    this.keyFeatures = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       url = Value(url),
       imageUrl = Value(imageUrl);
  static Insertable<App> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? shortDesc,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? imageUrl,
    Expression<int>? price,
    Expression<int>? shippingFee,
    Expression<String>? savingInfo,
    Expression<String>? benefitInfo,
    Expression<String>? shippingInfo,
    Expression<String>? storeName,
    Expression<String>? siteType,
    Expression<bool>? installed,
    Expression<String>? manufacturer,
    Expression<String>? brand,
    Expression<String>? modelName,
    Expression<String>? origin,
    Expression<String>? detailFeatures,
    Expression<String>? productForm,
    Expression<String>? capacity,
    Expression<String>? keyFeatures,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (shortDesc != null) 'short_desc': shortDesc,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (imageUrl != null) 'image_url': imageUrl,
      if (price != null) 'price': price,
      if (shippingFee != null) 'shipping_fee': shippingFee,
      if (savingInfo != null) 'saving_info': savingInfo,
      if (benefitInfo != null) 'benefit_info': benefitInfo,
      if (shippingInfo != null) 'shipping_info': shippingInfo,
      if (storeName != null) 'store_name': storeName,
      if (siteType != null) 'site_type': siteType,
      if (installed != null) 'installed': installed,
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (brand != null) 'brand': brand,
      if (modelName != null) 'model_name': modelName,
      if (origin != null) 'origin': origin,
      if (detailFeatures != null) 'detail_features': detailFeatures,
      if (productForm != null) 'product_form': productForm,
      if (capacity != null) 'capacity': capacity,
      if (keyFeatures != null) 'key_features': keyFeatures,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AppsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? shortDesc,
    Value<String>? description,
    Value<String>? url,
    Value<String>? imageUrl,
    Value<int>? price,
    Value<int>? shippingFee,
    Value<String?>? savingInfo,
    Value<String?>? benefitInfo,
    Value<String?>? shippingInfo,
    Value<String>? storeName,
    Value<String>? siteType,
    Value<bool>? installed,
    Value<String?>? manufacturer,
    Value<String?>? brand,
    Value<String?>? modelName,
    Value<String?>? origin,
    Value<String?>? detailFeatures,
    Value<String?>? productForm,
    Value<String?>? capacity,
    Value<String?>? keyFeatures,
    Value<DateTime>? updatedAt,
  }) {
    return AppsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      shortDesc: shortDesc ?? this.shortDesc,
      description: description ?? this.description,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      shippingFee: shippingFee ?? this.shippingFee,
      savingInfo: savingInfo ?? this.savingInfo,
      benefitInfo: benefitInfo ?? this.benefitInfo,
      shippingInfo: shippingInfo ?? this.shippingInfo,
      storeName: storeName ?? this.storeName,
      siteType: siteType ?? this.siteType,
      installed: installed ?? this.installed,
      manufacturer: manufacturer ?? this.manufacturer,
      brand: brand ?? this.brand,
      modelName: modelName ?? this.modelName,
      origin: origin ?? this.origin,
      detailFeatures: detailFeatures ?? this.detailFeatures,
      productForm: productForm ?? this.productForm,
      capacity: capacity ?? this.capacity,
      keyFeatures: keyFeatures ?? this.keyFeatures,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortDesc.present) {
      map['short_desc'] = Variable<String>(shortDesc.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (shippingFee.present) {
      map['shipping_fee'] = Variable<int>(shippingFee.value);
    }
    if (savingInfo.present) {
      map['saving_info'] = Variable<String>(savingInfo.value);
    }
    if (benefitInfo.present) {
      map['benefit_info'] = Variable<String>(benefitInfo.value);
    }
    if (shippingInfo.present) {
      map['shipping_info'] = Variable<String>(shippingInfo.value);
    }
    if (storeName.present) {
      map['store_name'] = Variable<String>(storeName.value);
    }
    if (siteType.present) {
      map['site_type'] = Variable<String>(siteType.value);
    }
    if (installed.present) {
      map['installed'] = Variable<bool>(installed.value);
    }
    if (manufacturer.present) {
      map['manufacturer'] = Variable<String>(manufacturer.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (modelName.present) {
      map['model_name'] = Variable<String>(modelName.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (detailFeatures.present) {
      map['detail_features'] = Variable<String>(detailFeatures.value);
    }
    if (productForm.present) {
      map['product_form'] = Variable<String>(productForm.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<String>(capacity.value);
    }
    if (keyFeatures.present) {
      map['key_features'] = Variable<String>(keyFeatures.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortDesc: $shortDesc, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('price: $price, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('savingInfo: $savingInfo, ')
          ..write('benefitInfo: $benefitInfo, ')
          ..write('shippingInfo: $shippingInfo, ')
          ..write('storeName: $storeName, ')
          ..write('siteType: $siteType, ')
          ..write('installed: $installed, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('brand: $brand, ')
          ..write('modelName: $modelName, ')
          ..write('origin: $origin, ')
          ..write('detailFeatures: $detailFeatures, ')
          ..write('productForm: $productForm, ')
          ..write('capacity: $capacity, ')
          ..write('keyFeatures: $keyFeatures, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  const Category({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(id: Value(id), name: Value(name));
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Category copyWith({int? id, String? name}) =>
      Category(id: id ?? this.id, name: name ?? this.name);
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && other.id == this.id && other.name == this.name);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CategoriesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CategoriesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $AppCategoryJoinsTable extends AppCategoryJoins
    with TableInfo<$AppCategoryJoinsTable, AppCategoryJoin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppCategoryJoinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _appIdMeta = const VerificationMeta('appId');
  @override
  late final GeneratedColumn<int> appId = GeneratedColumn<int>(
    'app_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES apps (id)',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [appId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_category_joins';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppCategoryJoin> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('app_id')) {
      context.handle(
        _appIdMeta,
        appId.isAcceptableOrUnknown(data['app_id']!, _appIdMeta),
      );
    } else if (isInserting) {
      context.missing(_appIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {appId, categoryId};
  @override
  AppCategoryJoin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppCategoryJoin(
      appId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}app_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
    );
  }

  @override
  $AppCategoryJoinsTable createAlias(String alias) {
    return $AppCategoryJoinsTable(attachedDatabase, alias);
  }
}

class AppCategoryJoin extends DataClass implements Insertable<AppCategoryJoin> {
  final int appId;
  final int categoryId;
  const AppCategoryJoin({required this.appId, required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['app_id'] = Variable<int>(appId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  AppCategoryJoinsCompanion toCompanion(bool nullToAbsent) {
    return AppCategoryJoinsCompanion(
      appId: Value(appId),
      categoryId: Value(categoryId),
    );
  }

  factory AppCategoryJoin.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppCategoryJoin(
      appId: serializer.fromJson<int>(json['appId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'appId': serializer.toJson<int>(appId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  AppCategoryJoin copyWith({int? appId, int? categoryId}) => AppCategoryJoin(
    appId: appId ?? this.appId,
    categoryId: categoryId ?? this.categoryId,
  );
  AppCategoryJoin copyWithCompanion(AppCategoryJoinsCompanion data) {
    return AppCategoryJoin(
      appId: data.appId.present ? data.appId.value : this.appId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppCategoryJoin(')
          ..write('appId: $appId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(appId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppCategoryJoin &&
          other.appId == this.appId &&
          other.categoryId == this.categoryId);
}

class AppCategoryJoinsCompanion extends UpdateCompanion<AppCategoryJoin> {
  final Value<int> appId;
  final Value<int> categoryId;
  final Value<int> rowid;
  const AppCategoryJoinsCompanion({
    this.appId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppCategoryJoinsCompanion.insert({
    required int appId,
    required int categoryId,
    this.rowid = const Value.absent(),
  }) : appId = Value(appId),
       categoryId = Value(categoryId);
  static Insertable<AppCategoryJoin> custom({
    Expression<int>? appId,
    Expression<int>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (appId != null) 'app_id': appId,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppCategoryJoinsCompanion copyWith({
    Value<int>? appId,
    Value<int>? categoryId,
    Value<int>? rowid,
  }) {
    return AppCategoryJoinsCompanion(
      appId: appId ?? this.appId,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (appId.present) {
      map['app_id'] = Variable<int>(appId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppCategoryJoinsCompanion(')
          ..write('appId: $appId, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HomeBannersTable extends HomeBanners
    with TableInfo<$HomeBannersTable, HomeBanner> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HomeBannersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtitleMeta = const VerificationMeta(
    'subtitle',
  );
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
    'subtitle',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetUrlMeta = const VerificationMeta(
    'targetUrl',
  );
  @override
  late final GeneratedColumn<String> targetUrl = GeneratedColumn<String>(
    'target_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gradAMeta = const VerificationMeta('gradA');
  @override
  late final GeneratedColumn<int> gradA = GeneratedColumn<int>(
    'grad_a',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gradBMeta = const VerificationMeta('gradB');
  @override
  late final GeneratedColumn<int> gradB = GeneratedColumn<int>(
    'grad_b',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    subtitle,
    targetUrl,
    imageUrl,
    gradA,
    gradB,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'home_banners';
  @override
  VerificationContext validateIntegrity(
    Insertable<HomeBanner> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(
        _subtitleMeta,
        subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta),
      );
    } else if (isInserting) {
      context.missing(_subtitleMeta);
    }
    if (data.containsKey('target_url')) {
      context.handle(
        _targetUrlMeta,
        targetUrl.isAcceptableOrUnknown(data['target_url']!, _targetUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_targetUrlMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('grad_a')) {
      context.handle(
        _gradAMeta,
        gradA.isAcceptableOrUnknown(data['grad_a']!, _gradAMeta),
      );
    } else if (isInserting) {
      context.missing(_gradAMeta);
    }
    if (data.containsKey('grad_b')) {
      context.handle(
        _gradBMeta,
        gradB.isAcceptableOrUnknown(data['grad_b']!, _gradBMeta),
      );
    } else if (isInserting) {
      context.missing(_gradBMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HomeBanner map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HomeBanner(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      subtitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subtitle'],
      )!,
      targetUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_url'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      gradA: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grad_a'],
      )!,
      gradB: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grad_b'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $HomeBannersTable createAlias(String alias) {
    return $HomeBannersTable(attachedDatabase, alias);
  }
}

class HomeBanner extends DataClass implements Insertable<HomeBanner> {
  final int id;
  final String title;
  final String subtitle;
  final String targetUrl;
  final String? imageUrl;
  final int gradA;
  final int gradB;
  final int sortOrder;
  const HomeBanner({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.targetUrl,
    this.imageUrl,
    required this.gradA,
    required this.gradB,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['subtitle'] = Variable<String>(subtitle);
    map['target_url'] = Variable<String>(targetUrl);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['grad_a'] = Variable<int>(gradA);
    map['grad_b'] = Variable<int>(gradB);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  HomeBannersCompanion toCompanion(bool nullToAbsent) {
    return HomeBannersCompanion(
      id: Value(id),
      title: Value(title),
      subtitle: Value(subtitle),
      targetUrl: Value(targetUrl),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      gradA: Value(gradA),
      gradB: Value(gradB),
      sortOrder: Value(sortOrder),
    );
  }

  factory HomeBanner.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HomeBanner(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      targetUrl: serializer.fromJson<String>(json['targetUrl']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      gradA: serializer.fromJson<int>(json['gradA']),
      gradB: serializer.fromJson<int>(json['gradB']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String>(subtitle),
      'targetUrl': serializer.toJson<String>(targetUrl),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'gradA': serializer.toJson<int>(gradA),
      'gradB': serializer.toJson<int>(gradB),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  HomeBanner copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? targetUrl,
    Value<String?> imageUrl = const Value.absent(),
    int? gradA,
    int? gradB,
    int? sortOrder,
  }) => HomeBanner(
    id: id ?? this.id,
    title: title ?? this.title,
    subtitle: subtitle ?? this.subtitle,
    targetUrl: targetUrl ?? this.targetUrl,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    gradA: gradA ?? this.gradA,
    gradB: gradB ?? this.gradB,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  HomeBanner copyWithCompanion(HomeBannersCompanion data) {
    return HomeBanner(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      targetUrl: data.targetUrl.present ? data.targetUrl.value : this.targetUrl,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      gradA: data.gradA.present ? data.gradA.value : this.gradA,
      gradB: data.gradB.present ? data.gradB.value : this.gradB,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HomeBanner(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('targetUrl: $targetUrl, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('gradA: $gradA, ')
          ..write('gradB: $gradB, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    subtitle,
    targetUrl,
    imageUrl,
    gradA,
    gradB,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeBanner &&
          other.id == this.id &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.targetUrl == this.targetUrl &&
          other.imageUrl == this.imageUrl &&
          other.gradA == this.gradA &&
          other.gradB == this.gradB &&
          other.sortOrder == this.sortOrder);
}

class HomeBannersCompanion extends UpdateCompanion<HomeBanner> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> subtitle;
  final Value<String> targetUrl;
  final Value<String?> imageUrl;
  final Value<int> gradA;
  final Value<int> gradB;
  final Value<int> sortOrder;
  const HomeBannersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.targetUrl = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.gradA = const Value.absent(),
    this.gradB = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  HomeBannersCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String subtitle,
    required String targetUrl,
    this.imageUrl = const Value.absent(),
    required int gradA,
    required int gradB,
    required int sortOrder,
  }) : title = Value(title),
       subtitle = Value(subtitle),
       targetUrl = Value(targetUrl),
       gradA = Value(gradA),
       gradB = Value(gradB),
       sortOrder = Value(sortOrder);
  static Insertable<HomeBanner> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<String>? targetUrl,
    Expression<String>? imageUrl,
    Expression<int>? gradA,
    Expression<int>? gradB,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (targetUrl != null) 'target_url': targetUrl,
      if (imageUrl != null) 'image_url': imageUrl,
      if (gradA != null) 'grad_a': gradA,
      if (gradB != null) 'grad_b': gradB,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  HomeBannersCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? subtitle,
    Value<String>? targetUrl,
    Value<String?>? imageUrl,
    Value<int>? gradA,
    Value<int>? gradB,
    Value<int>? sortOrder,
  }) {
    return HomeBannersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      targetUrl: targetUrl ?? this.targetUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      gradA: gradA ?? this.gradA,
      gradB: gradB ?? this.gradB,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (targetUrl.present) {
      map['target_url'] = Variable<String>(targetUrl.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (gradA.present) {
      map['grad_a'] = Variable<int>(gradA.value);
    }
    if (gradB.present) {
      map['grad_b'] = Variable<int>(gradB.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HomeBannersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('targetUrl: $targetUrl, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('gradA: $gradA, ')
          ..write('gradB: $gradB, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $RecentSearchesTable extends RecentSearches
    with TableInfo<$RecentSearchesTable, RecentSearche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentSearchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keywordMeta = const VerificationMeta(
    'keyword',
  );
  @override
  late final GeneratedColumn<String> keyword = GeneratedColumn<String>(
    'keyword',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _searchedAtMeta = const VerificationMeta(
    'searchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> searchedAt = GeneratedColumn<DateTime>(
    'searched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [keyword, searchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recent_searches';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecentSearche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('keyword')) {
      context.handle(
        _keywordMeta,
        keyword.isAcceptableOrUnknown(data['keyword']!, _keywordMeta),
      );
    } else if (isInserting) {
      context.missing(_keywordMeta);
    }
    if (data.containsKey('searched_at')) {
      context.handle(
        _searchedAtMeta,
        searchedAt.isAcceptableOrUnknown(data['searched_at']!, _searchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_searchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {keyword};
  @override
  RecentSearche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentSearche(
      keyword: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}keyword'],
      )!,
      searchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}searched_at'],
      )!,
    );
  }

  @override
  $RecentSearchesTable createAlias(String alias) {
    return $RecentSearchesTable(attachedDatabase, alias);
  }
}

class RecentSearche extends DataClass implements Insertable<RecentSearche> {
  final String keyword;
  final DateTime searchedAt;
  const RecentSearche({required this.keyword, required this.searchedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['keyword'] = Variable<String>(keyword);
    map['searched_at'] = Variable<DateTime>(searchedAt);
    return map;
  }

  RecentSearchesCompanion toCompanion(bool nullToAbsent) {
    return RecentSearchesCompanion(
      keyword: Value(keyword),
      searchedAt: Value(searchedAt),
    );
  }

  factory RecentSearche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentSearche(
      keyword: serializer.fromJson<String>(json['keyword']),
      searchedAt: serializer.fromJson<DateTime>(json['searchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'keyword': serializer.toJson<String>(keyword),
      'searchedAt': serializer.toJson<DateTime>(searchedAt),
    };
  }

  RecentSearche copyWith({String? keyword, DateTime? searchedAt}) =>
      RecentSearche(
        keyword: keyword ?? this.keyword,
        searchedAt: searchedAt ?? this.searchedAt,
      );
  RecentSearche copyWithCompanion(RecentSearchesCompanion data) {
    return RecentSearche(
      keyword: data.keyword.present ? data.keyword.value : this.keyword,
      searchedAt: data.searchedAt.present
          ? data.searchedAt.value
          : this.searchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecentSearche(')
          ..write('keyword: $keyword, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(keyword, searchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentSearche &&
          other.keyword == this.keyword &&
          other.searchedAt == this.searchedAt);
}

class RecentSearchesCompanion extends UpdateCompanion<RecentSearche> {
  final Value<String> keyword;
  final Value<DateTime> searchedAt;
  final Value<int> rowid;
  const RecentSearchesCompanion({
    this.keyword = const Value.absent(),
    this.searchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecentSearchesCompanion.insert({
    required String keyword,
    required DateTime searchedAt,
    this.rowid = const Value.absent(),
  }) : keyword = Value(keyword),
       searchedAt = Value(searchedAt);
  static Insertable<RecentSearche> custom({
    Expression<String>? keyword,
    Expression<DateTime>? searchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (keyword != null) 'keyword': keyword,
      if (searchedAt != null) 'searched_at': searchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecentSearchesCompanion copyWith({
    Value<String>? keyword,
    Value<DateTime>? searchedAt,
    Value<int>? rowid,
  }) {
    return RecentSearchesCompanion(
      keyword: keyword ?? this.keyword,
      searchedAt: searchedAt ?? this.searchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (keyword.present) {
      map['keyword'] = Variable<String>(keyword.value);
    }
    if (searchedAt.present) {
      map['searched_at'] = Variable<DateTime>(searchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentSearchesCompanion(')
          ..write('keyword: $keyword, ')
          ..write('searchedAt: $searchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuthProfilesTable extends AuthProfiles
    with TableInfo<$AuthProfilesTable, AuthProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isLoggedInMeta = const VerificationMeta(
    'isLoggedIn',
  );
  @override
  late final GeneratedColumn<bool> isLoggedIn = GeneratedColumn<bool>(
    'is_logged_in',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_logged_in" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    isLoggedIn,
    nickname,
    email,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_logged_in')) {
      context.handle(
        _isLoggedInMeta,
        isLoggedIn.isAcceptableOrUnknown(
          data['is_logged_in']!,
          _isLoggedInMeta,
        ),
      );
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      isLoggedIn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_logged_in'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AuthProfilesTable createAlias(String alias) {
    return $AuthProfilesTable(attachedDatabase, alias);
  }
}

class AuthProfile extends DataClass implements Insertable<AuthProfile> {
  final int id;
  final bool isLoggedIn;
  final String? nickname;
  final String? email;
  final DateTime updatedAt;
  const AuthProfile({
    required this.id,
    required this.isLoggedIn,
    this.nickname,
    this.email,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_logged_in'] = Variable<bool>(isLoggedIn);
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AuthProfilesCompanion toCompanion(bool nullToAbsent) {
    return AuthProfilesCompanion(
      id: Value(id),
      isLoggedIn: Value(isLoggedIn),
      nickname: nickname == null && nullToAbsent
          ? const Value.absent()
          : Value(nickname),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      updatedAt: Value(updatedAt),
    );
  }

  factory AuthProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthProfile(
      id: serializer.fromJson<int>(json['id']),
      isLoggedIn: serializer.fromJson<bool>(json['isLoggedIn']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      email: serializer.fromJson<String?>(json['email']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isLoggedIn': serializer.toJson<bool>(isLoggedIn),
      'nickname': serializer.toJson<String?>(nickname),
      'email': serializer.toJson<String?>(email),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AuthProfile copyWith({
    int? id,
    bool? isLoggedIn,
    Value<String?> nickname = const Value.absent(),
    Value<String?> email = const Value.absent(),
    DateTime? updatedAt,
  }) => AuthProfile(
    id: id ?? this.id,
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    nickname: nickname.present ? nickname.value : this.nickname,
    email: email.present ? email.value : this.email,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AuthProfile copyWithCompanion(AuthProfilesCompanion data) {
    return AuthProfile(
      id: data.id.present ? data.id.value : this.id,
      isLoggedIn: data.isLoggedIn.present
          ? data.isLoggedIn.value
          : this.isLoggedIn,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      email: data.email.present ? data.email.value : this.email,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthProfile(')
          ..write('id: $id, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('nickname: $nickname, ')
          ..write('email: $email, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isLoggedIn, nickname, email, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthProfile &&
          other.id == this.id &&
          other.isLoggedIn == this.isLoggedIn &&
          other.nickname == this.nickname &&
          other.email == this.email &&
          other.updatedAt == this.updatedAt);
}

class AuthProfilesCompanion extends UpdateCompanion<AuthProfile> {
  final Value<int> id;
  final Value<bool> isLoggedIn;
  final Value<String?> nickname;
  final Value<String?> email;
  final Value<DateTime> updatedAt;
  const AuthProfilesCompanion({
    this.id = const Value.absent(),
    this.isLoggedIn = const Value.absent(),
    this.nickname = const Value.absent(),
    this.email = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AuthProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.isLoggedIn = const Value.absent(),
    this.nickname = const Value.absent(),
    this.email = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<AuthProfile> custom({
    Expression<int>? id,
    Expression<bool>? isLoggedIn,
    Expression<String>? nickname,
    Expression<String>? email,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
      if (nickname != null) 'nickname': nickname,
      if (email != null) 'email': email,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AuthProfilesCompanion copyWith({
    Value<int>? id,
    Value<bool>? isLoggedIn,
    Value<String?>? nickname,
    Value<String?>? email,
    Value<DateTime>? updatedAt,
  }) {
    return AuthProfilesCompanion(
      id: id ?? this.id,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isLoggedIn.present) {
      map['is_logged_in'] = Variable<bool>(isLoggedIn.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthProfilesCompanion(')
          ..write('id: $id, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('nickname: $nickname, ')
          ..write('email: $email, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AuthAccountsTable extends AuthAccounts
    with TableInfo<$AuthAccountsTable, AuthAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE',
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, email, password, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth_accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthAccount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthAccount(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AuthAccountsTable createAlias(String alias) {
    return $AuthAccountsTable(attachedDatabase, alias);
  }
}

class AuthAccount extends DataClass implements Insertable<AuthAccount> {
  final int id;
  final String email;
  final String password;
  final DateTime createdAt;
  const AuthAccount({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AuthAccountsCompanion toCompanion(bool nullToAbsent) {
    return AuthAccountsCompanion(
      id: Value(id),
      email: Value(email),
      password: Value(password),
      createdAt: Value(createdAt),
    );
  }

  factory AuthAccount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthAccount(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AuthAccount copyWith({
    int? id,
    String? email,
    String? password,
    DateTime? createdAt,
  }) => AuthAccount(
    id: id ?? this.id,
    email: email ?? this.email,
    password: password ?? this.password,
    createdAt: createdAt ?? this.createdAt,
  );
  AuthAccount copyWithCompanion(AuthAccountsCompanion data) {
    return AuthAccount(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthAccount(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, password, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthAccount &&
          other.id == this.id &&
          other.email == this.email &&
          other.password == this.password &&
          other.createdAt == this.createdAt);
}

class AuthAccountsCompanion extends UpdateCompanion<AuthAccount> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> password;
  final Value<DateTime> createdAt;
  const AuthAccountsCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AuthAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String password,
    this.createdAt = const Value.absent(),
  }) : email = Value(email),
       password = Value(password);
  static Insertable<AuthAccount> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? password,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AuthAccountsCompanion copyWith({
    Value<int>? id,
    Value<String>? email,
    Value<String>? password,
    Value<DateTime>? createdAt,
  }) {
    return AuthAccountsCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthAccountsCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppsTable apps = $AppsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $AppCategoryJoinsTable appCategoryJoins = $AppCategoryJoinsTable(
    this,
  );
  late final $HomeBannersTable homeBanners = $HomeBannersTable(this);
  late final $RecentSearchesTable recentSearches = $RecentSearchesTable(this);
  late final $AuthProfilesTable authProfiles = $AuthProfilesTable(this);
  late final $AuthAccountsTable authAccounts = $AuthAccountsTable(this);
  late final StoreDao storeDao = StoreDao(this as AppDatabase);
  late final HomeBannerDao homeBannerDao = HomeBannerDao(this as AppDatabase);
  late final RecentSearchDao recentSearchDao = RecentSearchDao(
    this as AppDatabase,
  );
  late final AuthDao authDao = AuthDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    apps,
    categories,
    appCategoryJoins,
    homeBanners,
    recentSearches,
    authProfiles,
    authAccounts,
  ];
}

typedef $$AppsTableCreateCompanionBuilder =
    AppsCompanion Function({
      Value<int> id,
      required String name,
      Value<String> shortDesc,
      Value<String> description,
      required String url,
      required String imageUrl,
      Value<int> price,
      Value<int> shippingFee,
      Value<String?> savingInfo,
      Value<String?> benefitInfo,
      Value<String?> shippingInfo,
      Value<String> storeName,
      Value<String> siteType,
      Value<bool> installed,
      Value<String?> manufacturer,
      Value<String?> brand,
      Value<String?> modelName,
      Value<String?> origin,
      Value<String?> detailFeatures,
      Value<String?> productForm,
      Value<String?> capacity,
      Value<String?> keyFeatures,
      Value<DateTime> updatedAt,
    });
typedef $$AppsTableUpdateCompanionBuilder =
    AppsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> shortDesc,
      Value<String> description,
      Value<String> url,
      Value<String> imageUrl,
      Value<int> price,
      Value<int> shippingFee,
      Value<String?> savingInfo,
      Value<String?> benefitInfo,
      Value<String?> shippingInfo,
      Value<String> storeName,
      Value<String> siteType,
      Value<bool> installed,
      Value<String?> manufacturer,
      Value<String?> brand,
      Value<String?> modelName,
      Value<String?> origin,
      Value<String?> detailFeatures,
      Value<String?> productForm,
      Value<String?> capacity,
      Value<String?> keyFeatures,
      Value<DateTime> updatedAt,
    });

final class $$AppsTableReferences
    extends BaseReferences<_$AppDatabase, $AppsTable, App> {
  $$AppsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AppCategoryJoinsTable, List<AppCategoryJoin>>
  _appCategoryJoinsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.appCategoryJoins,
    aliasName: $_aliasNameGenerator(db.apps.id, db.appCategoryJoins.appId),
  );

  $$AppCategoryJoinsTableProcessedTableManager get appCategoryJoinsRefs {
    final manager = $$AppCategoryJoinsTableTableManager(
      $_db,
      $_db.appCategoryJoins,
    ).filter((f) => f.appId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _appCategoryJoinsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AppsTableFilterComposer extends Composer<_$AppDatabase, $AppsTable> {
  $$AppsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortDesc => $composableBuilder(
    column: $table.shortDesc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shippingFee => $composableBuilder(
    column: $table.shippingFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get savingInfo => $composableBuilder(
    column: $table.savingInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get benefitInfo => $composableBuilder(
    column: $table.benefitInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shippingInfo => $composableBuilder(
    column: $table.shippingInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get storeName => $composableBuilder(
    column: $table.storeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get siteType => $composableBuilder(
    column: $table.siteType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get installed => $composableBuilder(
    column: $table.installed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelName => $composableBuilder(
    column: $table.modelName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detailFeatures => $composableBuilder(
    column: $table.detailFeatures,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productForm => $composableBuilder(
    column: $table.productForm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keyFeatures => $composableBuilder(
    column: $table.keyFeatures,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> appCategoryJoinsRefs(
    Expression<bool> Function($$AppCategoryJoinsTableFilterComposer f) f,
  ) {
    final $$AppCategoryJoinsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appCategoryJoins,
      getReferencedColumn: (t) => t.appId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppCategoryJoinsTableFilterComposer(
            $db: $db,
            $table: $db.appCategoryJoins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppsTableOrderingComposer extends Composer<_$AppDatabase, $AppsTable> {
  $$AppsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortDesc => $composableBuilder(
    column: $table.shortDesc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shippingFee => $composableBuilder(
    column: $table.shippingFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get savingInfo => $composableBuilder(
    column: $table.savingInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get benefitInfo => $composableBuilder(
    column: $table.benefitInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shippingInfo => $composableBuilder(
    column: $table.shippingInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storeName => $composableBuilder(
    column: $table.storeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get siteType => $composableBuilder(
    column: $table.siteType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get installed => $composableBuilder(
    column: $table.installed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelName => $composableBuilder(
    column: $table.modelName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detailFeatures => $composableBuilder(
    column: $table.detailFeatures,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productForm => $composableBuilder(
    column: $table.productForm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keyFeatures => $composableBuilder(
    column: $table.keyFeatures,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppsTable> {
  $$AppsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get shortDesc =>
      $composableBuilder(column: $table.shortDesc, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get shippingFee => $composableBuilder(
    column: $table.shippingFee,
    builder: (column) => column,
  );

  GeneratedColumn<String> get savingInfo => $composableBuilder(
    column: $table.savingInfo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get benefitInfo => $composableBuilder(
    column: $table.benefitInfo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shippingInfo => $composableBuilder(
    column: $table.shippingInfo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get storeName =>
      $composableBuilder(column: $table.storeName, builder: (column) => column);

  GeneratedColumn<String> get siteType =>
      $composableBuilder(column: $table.siteType, builder: (column) => column);

  GeneratedColumn<bool> get installed =>
      $composableBuilder(column: $table.installed, builder: (column) => column);

  GeneratedColumn<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => column,
  );

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get modelName =>
      $composableBuilder(column: $table.modelName, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get detailFeatures => $composableBuilder(
    column: $table.detailFeatures,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productForm => $composableBuilder(
    column: $table.productForm,
    builder: (column) => column,
  );

  GeneratedColumn<String> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<String> get keyFeatures => $composableBuilder(
    column: $table.keyFeatures,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> appCategoryJoinsRefs<T extends Object>(
    Expression<T> Function($$AppCategoryJoinsTableAnnotationComposer a) f,
  ) {
    final $$AppCategoryJoinsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appCategoryJoins,
      getReferencedColumn: (t) => t.appId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppCategoryJoinsTableAnnotationComposer(
            $db: $db,
            $table: $db.appCategoryJoins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppsTable,
          App,
          $$AppsTableFilterComposer,
          $$AppsTableOrderingComposer,
          $$AppsTableAnnotationComposer,
          $$AppsTableCreateCompanionBuilder,
          $$AppsTableUpdateCompanionBuilder,
          (App, $$AppsTableReferences),
          App,
          PrefetchHooks Function({bool appCategoryJoinsRefs})
        > {
  $$AppsTableTableManager(_$AppDatabase db, $AppsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> shortDesc = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<int> shippingFee = const Value.absent(),
                Value<String?> savingInfo = const Value.absent(),
                Value<String?> benefitInfo = const Value.absent(),
                Value<String?> shippingInfo = const Value.absent(),
                Value<String> storeName = const Value.absent(),
                Value<String> siteType = const Value.absent(),
                Value<bool> installed = const Value.absent(),
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> modelName = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> detailFeatures = const Value.absent(),
                Value<String?> productForm = const Value.absent(),
                Value<String?> capacity = const Value.absent(),
                Value<String?> keyFeatures = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AppsCompanion(
                id: id,
                name: name,
                shortDesc: shortDesc,
                description: description,
                url: url,
                imageUrl: imageUrl,
                price: price,
                shippingFee: shippingFee,
                savingInfo: savingInfo,
                benefitInfo: benefitInfo,
                shippingInfo: shippingInfo,
                storeName: storeName,
                siteType: siteType,
                installed: installed,
                manufacturer: manufacturer,
                brand: brand,
                modelName: modelName,
                origin: origin,
                detailFeatures: detailFeatures,
                productForm: productForm,
                capacity: capacity,
                keyFeatures: keyFeatures,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> shortDesc = const Value.absent(),
                Value<String> description = const Value.absent(),
                required String url,
                required String imageUrl,
                Value<int> price = const Value.absent(),
                Value<int> shippingFee = const Value.absent(),
                Value<String?> savingInfo = const Value.absent(),
                Value<String?> benefitInfo = const Value.absent(),
                Value<String?> shippingInfo = const Value.absent(),
                Value<String> storeName = const Value.absent(),
                Value<String> siteType = const Value.absent(),
                Value<bool> installed = const Value.absent(),
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> modelName = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> detailFeatures = const Value.absent(),
                Value<String?> productForm = const Value.absent(),
                Value<String?> capacity = const Value.absent(),
                Value<String?> keyFeatures = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AppsCompanion.insert(
                id: id,
                name: name,
                shortDesc: shortDesc,
                description: description,
                url: url,
                imageUrl: imageUrl,
                price: price,
                shippingFee: shippingFee,
                savingInfo: savingInfo,
                benefitInfo: benefitInfo,
                shippingInfo: shippingInfo,
                storeName: storeName,
                siteType: siteType,
                installed: installed,
                manufacturer: manufacturer,
                brand: brand,
                modelName: modelName,
                origin: origin,
                detailFeatures: detailFeatures,
                productForm: productForm,
                capacity: capacity,
                keyFeatures: keyFeatures,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AppsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({appCategoryJoinsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (appCategoryJoinsRefs) db.appCategoryJoins,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (appCategoryJoinsRefs)
                    await $_getPrefetchedData<App, $AppsTable, AppCategoryJoin>(
                      currentTable: table,
                      referencedTable: $$AppsTableReferences
                          ._appCategoryJoinsRefsTable(db),
                      managerFromTypedResult: (p0) => $$AppsTableReferences(
                        db,
                        table,
                        p0,
                      ).appCategoryJoinsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.appId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AppsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppsTable,
      App,
      $$AppsTableFilterComposer,
      $$AppsTableOrderingComposer,
      $$AppsTableAnnotationComposer,
      $$AppsTableCreateCompanionBuilder,
      $$AppsTableUpdateCompanionBuilder,
      (App, $$AppsTableReferences),
      App,
      PrefetchHooks Function({bool appCategoryJoinsRefs})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({Value<int> id, required String name});
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({Value<int> id, Value<String> name});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AppCategoryJoinsTable, List<AppCategoryJoin>>
  _appCategoryJoinsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.appCategoryJoins,
    aliasName: $_aliasNameGenerator(
      db.categories.id,
      db.appCategoryJoins.categoryId,
    ),
  );

  $$AppCategoryJoinsTableProcessedTableManager get appCategoryJoinsRefs {
    final manager = $$AppCategoryJoinsTableTableManager(
      $_db,
      $_db.appCategoryJoins,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _appCategoryJoinsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> appCategoryJoinsRefs(
    Expression<bool> Function($$AppCategoryJoinsTableFilterComposer f) f,
  ) {
    final $$AppCategoryJoinsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appCategoryJoins,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppCategoryJoinsTableFilterComposer(
            $db: $db,
            $table: $db.appCategoryJoins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> appCategoryJoinsRefs<T extends Object>(
    Expression<T> Function($$AppCategoryJoinsTableAnnotationComposer a) f,
  ) {
    final $$AppCategoryJoinsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appCategoryJoins,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppCategoryJoinsTableAnnotationComposer(
            $db: $db,
            $table: $db.appCategoryJoins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool appCategoryJoinsRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => CategoriesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  CategoriesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({appCategoryJoinsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (appCategoryJoinsRefs) db.appCategoryJoins,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (appCategoryJoinsRefs)
                    await $_getPrefetchedData<
                      Category,
                      $CategoriesTable,
                      AppCategoryJoin
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._appCategoryJoinsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).appCategoryJoinsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool appCategoryJoinsRefs})
    >;
typedef $$AppCategoryJoinsTableCreateCompanionBuilder =
    AppCategoryJoinsCompanion Function({
      required int appId,
      required int categoryId,
      Value<int> rowid,
    });
typedef $$AppCategoryJoinsTableUpdateCompanionBuilder =
    AppCategoryJoinsCompanion Function({
      Value<int> appId,
      Value<int> categoryId,
      Value<int> rowid,
    });

final class $$AppCategoryJoinsTableReferences
    extends
        BaseReferences<_$AppDatabase, $AppCategoryJoinsTable, AppCategoryJoin> {
  $$AppCategoryJoinsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppsTable _appIdTable(_$AppDatabase db) => db.apps.createAlias(
    $_aliasNameGenerator(db.appCategoryJoins.appId, db.apps.id),
  );

  $$AppsTableProcessedTableManager get appId {
    final $_column = $_itemColumn<int>('app_id')!;

    final manager = $$AppsTableTableManager(
      $_db,
      $_db.apps,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_appIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.appCategoryJoins.categoryId, db.categories.id),
      );

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AppCategoryJoinsTableFilterComposer
    extends Composer<_$AppDatabase, $AppCategoryJoinsTable> {
  $$AppCategoryJoinsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AppsTableFilterComposer get appId {
    final $$AppsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appId,
      referencedTable: $db.apps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppsTableFilterComposer(
            $db: $db,
            $table: $db.apps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppCategoryJoinsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppCategoryJoinsTable> {
  $$AppCategoryJoinsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AppsTableOrderingComposer get appId {
    final $$AppsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appId,
      referencedTable: $db.apps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppsTableOrderingComposer(
            $db: $db,
            $table: $db.apps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppCategoryJoinsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppCategoryJoinsTable> {
  $$AppCategoryJoinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$AppsTableAnnotationComposer get appId {
    final $$AppsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appId,
      referencedTable: $db.apps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppsTableAnnotationComposer(
            $db: $db,
            $table: $db.apps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppCategoryJoinsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppCategoryJoinsTable,
          AppCategoryJoin,
          $$AppCategoryJoinsTableFilterComposer,
          $$AppCategoryJoinsTableOrderingComposer,
          $$AppCategoryJoinsTableAnnotationComposer,
          $$AppCategoryJoinsTableCreateCompanionBuilder,
          $$AppCategoryJoinsTableUpdateCompanionBuilder,
          (AppCategoryJoin, $$AppCategoryJoinsTableReferences),
          AppCategoryJoin,
          PrefetchHooks Function({bool appId, bool categoryId})
        > {
  $$AppCategoryJoinsTableTableManager(
    _$AppDatabase db,
    $AppCategoryJoinsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppCategoryJoinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppCategoryJoinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppCategoryJoinsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> appId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppCategoryJoinsCompanion(
                appId: appId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int appId,
                required int categoryId,
                Value<int> rowid = const Value.absent(),
              }) => AppCategoryJoinsCompanion.insert(
                appId: appId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AppCategoryJoinsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({appId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (appId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.appId,
                                referencedTable:
                                    $$AppCategoryJoinsTableReferences
                                        ._appIdTable(db),
                                referencedColumn:
                                    $$AppCategoryJoinsTableReferences
                                        ._appIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable:
                                    $$AppCategoryJoinsTableReferences
                                        ._categoryIdTable(db),
                                referencedColumn:
                                    $$AppCategoryJoinsTableReferences
                                        ._categoryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AppCategoryJoinsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppCategoryJoinsTable,
      AppCategoryJoin,
      $$AppCategoryJoinsTableFilterComposer,
      $$AppCategoryJoinsTableOrderingComposer,
      $$AppCategoryJoinsTableAnnotationComposer,
      $$AppCategoryJoinsTableCreateCompanionBuilder,
      $$AppCategoryJoinsTableUpdateCompanionBuilder,
      (AppCategoryJoin, $$AppCategoryJoinsTableReferences),
      AppCategoryJoin,
      PrefetchHooks Function({bool appId, bool categoryId})
    >;
typedef $$HomeBannersTableCreateCompanionBuilder =
    HomeBannersCompanion Function({
      Value<int> id,
      required String title,
      required String subtitle,
      required String targetUrl,
      Value<String?> imageUrl,
      required int gradA,
      required int gradB,
      required int sortOrder,
    });
typedef $$HomeBannersTableUpdateCompanionBuilder =
    HomeBannersCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> subtitle,
      Value<String> targetUrl,
      Value<String?> imageUrl,
      Value<int> gradA,
      Value<int> gradB,
      Value<int> sortOrder,
    });

class $$HomeBannersTableFilterComposer
    extends Composer<_$AppDatabase, $HomeBannersTable> {
  $$HomeBannersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetUrl => $composableBuilder(
    column: $table.targetUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gradA => $composableBuilder(
    column: $table.gradA,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gradB => $composableBuilder(
    column: $table.gradB,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HomeBannersTableOrderingComposer
    extends Composer<_$AppDatabase, $HomeBannersTable> {
  $$HomeBannersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetUrl => $composableBuilder(
    column: $table.targetUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gradA => $composableBuilder(
    column: $table.gradA,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gradB => $composableBuilder(
    column: $table.gradB,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HomeBannersTableAnnotationComposer
    extends Composer<_$AppDatabase, $HomeBannersTable> {
  $$HomeBannersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get targetUrl =>
      $composableBuilder(column: $table.targetUrl, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get gradA =>
      $composableBuilder(column: $table.gradA, builder: (column) => column);

  GeneratedColumn<int> get gradB =>
      $composableBuilder(column: $table.gradB, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$HomeBannersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HomeBannersTable,
          HomeBanner,
          $$HomeBannersTableFilterComposer,
          $$HomeBannersTableOrderingComposer,
          $$HomeBannersTableAnnotationComposer,
          $$HomeBannersTableCreateCompanionBuilder,
          $$HomeBannersTableUpdateCompanionBuilder,
          (
            HomeBanner,
            BaseReferences<_$AppDatabase, $HomeBannersTable, HomeBanner>,
          ),
          HomeBanner,
          PrefetchHooks Function()
        > {
  $$HomeBannersTableTableManager(_$AppDatabase db, $HomeBannersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HomeBannersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HomeBannersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HomeBannersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> subtitle = const Value.absent(),
                Value<String> targetUrl = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int> gradA = const Value.absent(),
                Value<int> gradB = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => HomeBannersCompanion(
                id: id,
                title: title,
                subtitle: subtitle,
                targetUrl: targetUrl,
                imageUrl: imageUrl,
                gradA: gradA,
                gradB: gradB,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String subtitle,
                required String targetUrl,
                Value<String?> imageUrl = const Value.absent(),
                required int gradA,
                required int gradB,
                required int sortOrder,
              }) => HomeBannersCompanion.insert(
                id: id,
                title: title,
                subtitle: subtitle,
                targetUrl: targetUrl,
                imageUrl: imageUrl,
                gradA: gradA,
                gradB: gradB,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HomeBannersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HomeBannersTable,
      HomeBanner,
      $$HomeBannersTableFilterComposer,
      $$HomeBannersTableOrderingComposer,
      $$HomeBannersTableAnnotationComposer,
      $$HomeBannersTableCreateCompanionBuilder,
      $$HomeBannersTableUpdateCompanionBuilder,
      (
        HomeBanner,
        BaseReferences<_$AppDatabase, $HomeBannersTable, HomeBanner>,
      ),
      HomeBanner,
      PrefetchHooks Function()
    >;
typedef $$RecentSearchesTableCreateCompanionBuilder =
    RecentSearchesCompanion Function({
      required String keyword,
      required DateTime searchedAt,
      Value<int> rowid,
    });
typedef $$RecentSearchesTableUpdateCompanionBuilder =
    RecentSearchesCompanion Function({
      Value<String> keyword,
      Value<DateTime> searchedAt,
      Value<int> rowid,
    });

class $$RecentSearchesTableFilterComposer
    extends Composer<_$AppDatabase, $RecentSearchesTable> {
  $$RecentSearchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get keyword => $composableBuilder(
    column: $table.keyword,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get searchedAt => $composableBuilder(
    column: $table.searchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecentSearchesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecentSearchesTable> {
  $$RecentSearchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get keyword => $composableBuilder(
    column: $table.keyword,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get searchedAt => $composableBuilder(
    column: $table.searchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecentSearchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecentSearchesTable> {
  $$RecentSearchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get keyword =>
      $composableBuilder(column: $table.keyword, builder: (column) => column);

  GeneratedColumn<DateTime> get searchedAt => $composableBuilder(
    column: $table.searchedAt,
    builder: (column) => column,
  );
}

class $$RecentSearchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecentSearchesTable,
          RecentSearche,
          $$RecentSearchesTableFilterComposer,
          $$RecentSearchesTableOrderingComposer,
          $$RecentSearchesTableAnnotationComposer,
          $$RecentSearchesTableCreateCompanionBuilder,
          $$RecentSearchesTableUpdateCompanionBuilder,
          (
            RecentSearche,
            BaseReferences<_$AppDatabase, $RecentSearchesTable, RecentSearche>,
          ),
          RecentSearche,
          PrefetchHooks Function()
        > {
  $$RecentSearchesTableTableManager(
    _$AppDatabase db,
    $RecentSearchesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecentSearchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecentSearchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecentSearchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> keyword = const Value.absent(),
                Value<DateTime> searchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecentSearchesCompanion(
                keyword: keyword,
                searchedAt: searchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String keyword,
                required DateTime searchedAt,
                Value<int> rowid = const Value.absent(),
              }) => RecentSearchesCompanion.insert(
                keyword: keyword,
                searchedAt: searchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecentSearchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecentSearchesTable,
      RecentSearche,
      $$RecentSearchesTableFilterComposer,
      $$RecentSearchesTableOrderingComposer,
      $$RecentSearchesTableAnnotationComposer,
      $$RecentSearchesTableCreateCompanionBuilder,
      $$RecentSearchesTableUpdateCompanionBuilder,
      (
        RecentSearche,
        BaseReferences<_$AppDatabase, $RecentSearchesTable, RecentSearche>,
      ),
      RecentSearche,
      PrefetchHooks Function()
    >;
typedef $$AuthProfilesTableCreateCompanionBuilder =
    AuthProfilesCompanion Function({
      Value<int> id,
      Value<bool> isLoggedIn,
      Value<String?> nickname,
      Value<String?> email,
      Value<DateTime> updatedAt,
    });
typedef $$AuthProfilesTableUpdateCompanionBuilder =
    AuthProfilesCompanion Function({
      Value<int> id,
      Value<bool> isLoggedIn,
      Value<String?> nickname,
      Value<String?> email,
      Value<DateTime> updatedAt,
    });

class $$AuthProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $AuthProfilesTable> {
  $$AuthProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuthProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthProfilesTable> {
  $$AuthProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuthProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthProfilesTable> {
  $$AuthProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AuthProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthProfilesTable,
          AuthProfile,
          $$AuthProfilesTableFilterComposer,
          $$AuthProfilesTableOrderingComposer,
          $$AuthProfilesTableAnnotationComposer,
          $$AuthProfilesTableCreateCompanionBuilder,
          $$AuthProfilesTableUpdateCompanionBuilder,
          (
            AuthProfile,
            BaseReferences<_$AppDatabase, $AuthProfilesTable, AuthProfile>,
          ),
          AuthProfile,
          PrefetchHooks Function()
        > {
  $$AuthProfilesTableTableManager(_$AppDatabase db, $AuthProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> isLoggedIn = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AuthProfilesCompanion(
                id: id,
                isLoggedIn: isLoggedIn,
                nickname: nickname,
                email: email,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> isLoggedIn = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AuthProfilesCompanion.insert(
                id: id,
                isLoggedIn: isLoggedIn,
                nickname: nickname,
                email: email,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuthProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthProfilesTable,
      AuthProfile,
      $$AuthProfilesTableFilterComposer,
      $$AuthProfilesTableOrderingComposer,
      $$AuthProfilesTableAnnotationComposer,
      $$AuthProfilesTableCreateCompanionBuilder,
      $$AuthProfilesTableUpdateCompanionBuilder,
      (
        AuthProfile,
        BaseReferences<_$AppDatabase, $AuthProfilesTable, AuthProfile>,
      ),
      AuthProfile,
      PrefetchHooks Function()
    >;
typedef $$AuthAccountsTableCreateCompanionBuilder =
    AuthAccountsCompanion Function({
      Value<int> id,
      required String email,
      required String password,
      Value<DateTime> createdAt,
    });
typedef $$AuthAccountsTableUpdateCompanionBuilder =
    AuthAccountsCompanion Function({
      Value<int> id,
      Value<String> email,
      Value<String> password,
      Value<DateTime> createdAt,
    });

class $$AuthAccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AuthAccountsTable> {
  $$AuthAccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuthAccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthAccountsTable> {
  $$AuthAccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuthAccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthAccountsTable> {
  $$AuthAccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AuthAccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthAccountsTable,
          AuthAccount,
          $$AuthAccountsTableFilterComposer,
          $$AuthAccountsTableOrderingComposer,
          $$AuthAccountsTableAnnotationComposer,
          $$AuthAccountsTableCreateCompanionBuilder,
          $$AuthAccountsTableUpdateCompanionBuilder,
          (
            AuthAccount,
            BaseReferences<_$AppDatabase, $AuthAccountsTable, AuthAccount>,
          ),
          AuthAccount,
          PrefetchHooks Function()
        > {
  $$AuthAccountsTableTableManager(_$AppDatabase db, $AuthAccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthAccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthAccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthAccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuthAccountsCompanion(
                id: id,
                email: email,
                password: password,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String email,
                required String password,
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuthAccountsCompanion.insert(
                id: id,
                email: email,
                password: password,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuthAccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthAccountsTable,
      AuthAccount,
      $$AuthAccountsTableFilterComposer,
      $$AuthAccountsTableOrderingComposer,
      $$AuthAccountsTableAnnotationComposer,
      $$AuthAccountsTableCreateCompanionBuilder,
      $$AuthAccountsTableUpdateCompanionBuilder,
      (
        AuthAccount,
        BaseReferences<_$AppDatabase, $AuthAccountsTable, AuthAccount>,
      ),
      AuthAccount,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppsTableTableManager get apps => $$AppsTableTableManager(_db, _db.apps);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$AppCategoryJoinsTableTableManager get appCategoryJoins =>
      $$AppCategoryJoinsTableTableManager(_db, _db.appCategoryJoins);
  $$HomeBannersTableTableManager get homeBanners =>
      $$HomeBannersTableTableManager(_db, _db.homeBanners);
  $$RecentSearchesTableTableManager get recentSearches =>
      $$RecentSearchesTableTableManager(_db, _db.recentSearches);
  $$AuthProfilesTableTableManager get authProfiles =>
      $$AuthProfilesTableTableManager(_db, _db.authProfiles);
  $$AuthAccountsTableTableManager get authAccounts =>
      $$AuthAccountsTableTableManager(_db, _db.authAccounts);
}

mixin _$StoreDaoMixin on DatabaseAccessor<AppDatabase> {
  $AppsTable get apps => attachedDatabase.apps;
  $CategoriesTable get categories => attachedDatabase.categories;
  $AppCategoryJoinsTable get appCategoryJoins =>
      attachedDatabase.appCategoryJoins;
  StoreDaoManager get managers => StoreDaoManager(this);
}

class StoreDaoManager {
  final _$StoreDaoMixin _db;
  StoreDaoManager(this._db);
  $$AppsTableTableManager get apps =>
      $$AppsTableTableManager(_db.attachedDatabase, _db.apps);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$AppCategoryJoinsTableTableManager get appCategoryJoins =>
      $$AppCategoryJoinsTableTableManager(
        _db.attachedDatabase,
        _db.appCategoryJoins,
      );
}

mixin _$HomeBannerDaoMixin on DatabaseAccessor<AppDatabase> {
  $HomeBannersTable get homeBanners => attachedDatabase.homeBanners;
  HomeBannerDaoManager get managers => HomeBannerDaoManager(this);
}

class HomeBannerDaoManager {
  final _$HomeBannerDaoMixin _db;
  HomeBannerDaoManager(this._db);
  $$HomeBannersTableTableManager get homeBanners =>
      $$HomeBannersTableTableManager(_db.attachedDatabase, _db.homeBanners);
}

mixin _$RecentSearchDaoMixin on DatabaseAccessor<AppDatabase> {
  $RecentSearchesTable get recentSearches => attachedDatabase.recentSearches;
  RecentSearchDaoManager get managers => RecentSearchDaoManager(this);
}

class RecentSearchDaoManager {
  final _$RecentSearchDaoMixin _db;
  RecentSearchDaoManager(this._db);
  $$RecentSearchesTableTableManager get recentSearches =>
      $$RecentSearchesTableTableManager(
        _db.attachedDatabase,
        _db.recentSearches,
      );
}

mixin _$AuthDaoMixin on DatabaseAccessor<AppDatabase> {
  $AuthProfilesTable get authProfiles => attachedDatabase.authProfiles;
  $AuthAccountsTable get authAccounts => attachedDatabase.authAccounts;
  AuthDaoManager get managers => AuthDaoManager(this);
}

class AuthDaoManager {
  final _$AuthDaoMixin _db;
  AuthDaoManager(this._db);
  $$AuthProfilesTableTableManager get authProfiles =>
      $$AuthProfilesTableTableManager(_db.attachedDatabase, _db.authProfiles);
  $$AuthAccountsTableTableManager get authAccounts =>
      $$AuthAccountsTableTableManager(_db.attachedDatabase, _db.authAccounts);
}
