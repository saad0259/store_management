import 'dart:io';

import 'package:drift/drift.dart';
// These imports are only needed to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Customers extends Table {
  TextColumn get uid => text()();
  IntColumn get serialNumber => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get isSynced => boolean().withDefault(Constant(false))();
  TextColumn get createdAt => text()();
  TextColumn get deletedAt => text().nullable()();
}

class Products extends Table {
  TextColumn get uid => text()();
  IntColumn get serialNumber => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get isSynced => boolean().withDefault(Constant(false))();
  TextColumn get createdAt => text()();
  TextColumn get deletedAt => text().nullable()();
}

class DailySales extends Table {
  TextColumn get uid => text()();
  IntColumn get serialNumber => integer().autoIncrement()();
  TextColumn get date => text()();
  TextColumn get customerId => text()();
  TextColumn get productId => text()();
  IntColumn get quantity => integer()();
  RealColumn get pricePerItem => real()();
  RealColumn get subTotal => real()();
  RealColumn get marketFee => real()();
  RealColumn get total => real()();
  BoolColumn get isSynced => boolean().withDefault(Constant(false))();
  TextColumn get createdAt => text()();
  TextColumn get deletedAt => text().nullable()();
}

@DriftDatabase(
  tables: [
    Customers,
    Products,
    DailySales,
  ],
)
class MyAppDb extends _$MyAppDb {
  MyAppDb() : super(_openConnection()); // Class Constructor

  @override
  int get schemaVersion => 1; // Schemea getter

  //Customers
  Stream<List<Customer>> get watchAllCutomers => (select(customers)
        ..where((tbl) => tbl.deletedAt.isNull())
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
      .watch();

  Future<int> createOrUpdateCustomer(CustomersCompanion entry) {
    return into(customers).insertOnConflictUpdate(entry);
  }

  //Products
  Stream<List<Product>> get watchAllProducts => (select(products)
        ..where((tbl) => tbl.deletedAt.isNull())
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
      .watch();

  Future<int> createOrUpdateProduct(ProductsCompanion entry) {
    return into(products).insertOnConflictUpdate(entry);
  }

  //Daily Sales
  Stream<List<DailySale>> get watchAllDailySales => (select(dailySales)
        ..where((tbl) => tbl.deletedAt.isNull())
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
      .watch();

  Future<int> createOrUpdateDailySale(DailySalesCompanion entry) {
    return into(dailySales).insertOnConflictUpdate(entry);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'store_management_db.sqlite'));
    return NativeDatabase(file);
  });
}
