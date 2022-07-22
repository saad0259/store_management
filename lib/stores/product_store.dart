import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../db/db_helper/db_helper.dart';
import '../models/product.dart';
import '../service_locator.dart';
import '../utils/function_response.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  _ProductStore(this.dbHelper);

  final DbHelper dbHelper;

  @observable
  ObservableList<Product> productList = ObservableList<Product>.of([]);

  @action
  Stream<List<Product>> watchProducts() {
    return dbHelper.watchDbProducts();
  }

  @action
  Future<FunctionResponse> addProduct(Product product) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      log('Id I sent: ${product.uid}');
      final int? dbId = await dbHelper.addOrUpdateProducts(
        id: product.uid,
        name: product.name,
        createdAt: DateTime.now().toIso8601String(),
      );

      productList.add(product);
      fResponse.passed();
    } catch (e) {
      log(e.toString());
    }
    return fResponse;
  }

  @action
  Future<void> removeProduct(Product product) async {
    final int? id = await dbHelper.addOrUpdateProducts(
      id: product.uid,
      serialNumber: product.serialNumber,
      name: product.name,
      createdAt: product.createdAt.toIso8601String(),
      deletedAt: DateTime.now().toIso8601String(),
    );
    if (id != null) productList.remove(product);
  }
}
