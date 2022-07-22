// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on _ProductStore, Store {
  late final _$productListAtom =
      Atom(name: '_ProductStore.productList', context: context);

  @override
  ObservableList<Product> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(ObservableList<Product> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  late final _$addProductAsyncAction =
      AsyncAction('_ProductStore.addProduct', context: context);

  @override
  Future<FunctionResponse> addProduct(Product product) {
    return _$addProductAsyncAction.run(() => super.addProduct(product));
  }

  late final _$removeProductAsyncAction =
      AsyncAction('_ProductStore.removeProduct', context: context);

  @override
  Future<void> removeProduct(Product product) {
    return _$removeProductAsyncAction.run(() => super.removeProduct(product));
  }

  late final _$_ProductStoreActionController =
      ActionController(name: '_ProductStore', context: context);

  @override
  Stream<List<Product>> watchProducts() {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.watchProducts');
    try {
      return super.watchProducts();
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productList: ${productList}
    ''';
  }
}
