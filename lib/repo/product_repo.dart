import 'dart:developer';

import '../db/db_helper/db_helper.dart';
import '../models/product.dart';
import '../service_locator.dart';
import '../utils/function_response.dart';

class ProductRepo {
  ProductRepo(this.dbHelper);
  final DbHelper dbHelper;
  Stream<List<Product>> watchProducts() {
    return dbHelper.watchDbProducts();
  }

  Future<List<Product>> getProducts() async {
    return await dbHelper.watchDbProducts().first;
  }

  Future<Product?> getProductById(String id) async {
    return await dbHelper.getProductById(int.parse(id));
  }

  Future<Product?> getProductBySerial(String serial) async {
    return await dbHelper.getProductBySerial(int.parse(serial));
  }

  Future<FunctionResponse> addProduct(Product product) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      final int? dbId = await dbHelper.addOrUpdateProducts(
        id: product.uid,
        name: product.name,
        createdAt: DateTime.now().toIso8601String(),
      );

      fResponse.passed();
    } catch (e) {
      log(e.toString());
    }
    return fResponse;
  }

  Future<void> removeProduct(Product product) async {
    final int? id = await dbHelper.addOrUpdateProducts(
      id: product.uid,
      serialNumber: product.serialNumber,
      name: product.name,
      createdAt: product.createdAt.toIso8601String(),
      deletedAt: DateTime.now().toIso8601String(),
      syncedAt:
          product.syncedAt == null ? null : product.syncedAt!.toIso8601String(),
    );
  }
}
