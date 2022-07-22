import 'dart:developer';

import 'package:drift/drift.dart';

import '../../models/daily_sale.dart';
import '../../models/product.dart';
import '../database.dart' as db
    show
        Customer,
        CustomersCompanion,
        Product,
        ProductsCompanion,
        DailySale,
        DailySalesCompanion,
        MyAppDb;

import '../../models/customer.dart';

class DbHelper {
  final db.MyAppDb _db;
  DbHelper(this._db);

//Customer
  Stream<List<Customer>> watchDbCustomers() {
    final Stream<List<db.Customer>> dbCustomers = _db.watchAllCutomers;
    return dbCustomers.map((event) => event
        .map((e) => Customer(
              uid: e.uid,
              name: e.name,
              serialNumber: e.serialNumber,
              createdAt: DateTime.parse(e.createdAt),
              deletedAt:
                  e.deletedAt == null ? null : DateTime.parse(e.deletedAt!),
              isSynced: e.isSynced,
            ))
        .toList());
  }

  Future<int?> addOrUpdateDbCustomers({
    required String? id,
    required String name,
    required String createdAt,
    String? deletedAt,
    int? serialNumber,
    bool isSynced = false,
  }) async {
    try {
      final _customerId =
          await _db.createOrUpdateCustomer(db.CustomersCompanion(
        uid: id == null ? const Value.absent() : Value(id),
        serialNumber:
            serialNumber == null ? const Value.absent() : Value(serialNumber),
        name: Value(name),
        createdAt: Value(createdAt),
        deletedAt: deletedAt == null ? const Value.absent() : Value(deletedAt),
        isSynced: Value(isSynced),
      ));
      return _customerId;
    } catch (e) {
      log('Error in addOrUpdateDbCustomers: $e');
    }
    return null;
  }

  //Products

  Stream<List<Product>> watchDbProducts() {
    final Stream<List<db.Product>> dbProducts = _db.watchAllProducts;
    return dbProducts.map((event) => event
        .map((e) => Product(
              uid: e.uid,
              name: e.name,
              serialNumber: e.serialNumber,
              createdAt: DateTime.parse(e.createdAt),
              deletedAt:
                  e.deletedAt == null ? null : DateTime.parse(e.deletedAt!),
              isSynced: e.isSynced,
            ))
        .toList());
  }

  Future<int?> addOrUpdateProducts({
    required String? id,
    required String name,
    required String createdAt,
    String? deletedAt,
    int? serialNumber,
    bool isSynced = false,
  }) async {
    try {
      final productId = await _db.createOrUpdateProduct(db.ProductsCompanion(
        uid: id == null ? const Value.absent() : Value(id),
        serialNumber:
            serialNumber == null ? const Value.absent() : Value(serialNumber),
        name: Value(name),
        createdAt: Value(createdAt),
        deletedAt: deletedAt == null ? const Value.absent() : Value(deletedAt),
        isSynced: Value(isSynced),
      ));
      return productId;
    } catch (e) {
      log('Error in addOrUpdateProducts: $e');
    }
    return null;
  }

  //Daily Sales
  Stream<List<DailySale>> watchDbDailySales() {
    final Stream<List<db.DailySale>> dbDailySales = _db.watchAllDailySales;
    return dbDailySales.map((event) => event
        .map((e) => DailySale(
              uid: e.uid,
              serialNumber: e.serialNumber,
              date: DateTime.parse(e.date),
              customerId: e.customerId,
              productId: e.productId,
              quantity: e.quantity,
              pricePerItem: e.pricePerItem,
              subTotal: e.subTotal,
              marketFee: e.marketFee,
              total: e.total,
              createdAt: DateTime.parse(e.createdAt),
              deletedAt:
                  e.deletedAt == null ? null : DateTime.parse(e.deletedAt!),
              isSynced: e.isSynced,
            ))
        .toList());
  }

  Future<int?> addOrUpdateDailySales({
    required String? id,
    int? serialNumber,
    required String date,
    required String customerId,
    required String productId,
    required int quantity,
    required double pricePerItem,
    required double subTotal,
    required double marketFee,
    required double total,
    required String createdAt,
    String? deletedAt,
    bool isSynced = false,
  }) async {
    try {
      final dailySaleId = await _db.createOrUpdateDailySale(
        db.DailySalesCompanion(
          uid: id == null ? const Value.absent() : Value(id),
          serialNumber:
              serialNumber == null ? const Value.absent() : Value(serialNumber),
          date: Value(date),
          customerId: Value(customerId),
          productId: Value(productId),
          quantity: Value(quantity),
          pricePerItem: Value(pricePerItem),
          subTotal: Value(subTotal),
          marketFee: Value(marketFee),
          total: Value(total),
          createdAt: Value(createdAt),
          deletedAt:
              deletedAt == null ? const Value.absent() : Value(deletedAt),
          isSynced: Value(isSynced),
        ),
      );
      return dailySaleId;
    } catch (e) {
      log('Error in addOrUpdateDailySales: $e');
    }
    return null;
  }
}
