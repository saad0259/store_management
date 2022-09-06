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

  Future<Customer?> getCustomerById(int id) async {
    Customer? customer;
    try {
      final db.Customer dbCustomer = await _db.getCustomerById(id.toString());

      customer = Customer.fromDb(dbCustomer);
    } catch (e) {
      log('Error getting customer by id : $e');
    }

    return customer;
  }

  Future<Customer?> getCustomerBySerial(int serial) async {
    Customer? customer;
    try {
      final db.Customer dbCustomer = await _db.getCustomerBySerial(serial);

      customer = Customer.fromDb(dbCustomer);
    } catch (e) {
      log('Error getting customer by serial : $e');
    }

    return customer;
  }

  Stream<List<Customer>> watchDbCustomers() {
    final Stream<List<db.Customer>> dbCustomers = _db.watchAllCutomers;
    return dbCustomers
        .map((event) => event.map((e) => Customer.fromDb(e)).toList());
  }

  Future<int?> addOrUpdateDbCustomers(
    Customer customer,
  ) async {
    try {
      final _customerId = await _db.createOrUpdateCustomer(customer.toDb());
      return _customerId;
    } catch (e) {
      log('Error in addOrUpdateDbCustomers: $e');
    }
    return null;
  }

  //Products

  Future<Product?> getProductById(int id) async {
    Product? product;
    try {
      final db.Product dbProduct = await _db.getProductById(id.toString());

      product = Product.fromDb(dbProduct);
    } catch (e) {
      log('Error getting product by id : $e');
    }

    return product;
  }

  Future<Product?> getProductBySerial(int serial) async {
    Product? product;
    try {
      final db.Product dbProduct = await _db.getProductBySerial(serial);

      product = Product.fromDb(dbProduct);
    } catch (e) {
      log('Error getting product by serial : $e');
    }

    return product;
  }

  Stream<List<Product>> watchDbProducts() {
    final Stream<List<db.Product>> dbProducts = _db.watchAllProducts;
    return dbProducts
        .map((event) => event.map((e) => Product.fromDb(e)).toList());
  }

  Future<int?> addOrUpdateProducts({
    required String? id,
    required String name,
    required String createdAt,
    String? deletedAt,
    int? serialNumber,
    String? syncedAt,
  }) async {
    try {
      final productId = await _db.createOrUpdateProduct(db.ProductsCompanion(
        uid: id == null ? const Value.absent() : Value(id),
        serialNumber:
            serialNumber == null ? const Value.absent() : Value(serialNumber),
        name: Value(name),
        createdAt: Value(createdAt),
        deletedAt: deletedAt == null ? const Value.absent() : Value(deletedAt),
        syncedAt: syncedAt == null ? const Value.absent() : Value(syncedAt),
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
    return dbDailySales
        .map((event) => event.map((e) => DailySale.fromDb(e)).toList());
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
    String? syncedAt,
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
          syncedAt: syncedAt == null ? const Value.absent() : Value(syncedAt),
        ),
      );
      return dailySaleId;
    } catch (e) {
      log('Error in addOrUpdateDailySales: $e');
    }
    return null;
  }
}
