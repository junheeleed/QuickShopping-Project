import 'package:drift/drift.dart';

class AuthAccounts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get email => text().customConstraint('UNIQUE')();
  TextColumn get password => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
