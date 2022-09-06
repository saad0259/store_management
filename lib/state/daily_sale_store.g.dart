// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sale_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DailySaleStore on _DailySaleStore, Store {
  late final _$selectedDateAtom =
      Atom(name: '_DailySaleStore.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$selectedCustomerAtom =
      Atom(name: '_DailySaleStore.selectedCustomer', context: context);

  @override
  Customer? get selectedCustomer {
    _$selectedCustomerAtom.reportRead();
    return super.selectedCustomer;
  }

  @override
  set selectedCustomer(Customer? value) {
    _$selectedCustomerAtom.reportWrite(value, super.selectedCustomer, () {
      super.selectedCustomer = value;
    });
  }

  late final _$selectedProductAtom =
      Atom(name: '_DailySaleStore.selectedProduct', context: context);

  @override
  Product? get selectedProduct {
    _$selectedProductAtom.reportRead();
    return super.selectedProduct;
  }

  @override
  set selectedProduct(Product? value) {
    _$selectedProductAtom.reportWrite(value, super.selectedProduct, () {
      super.selectedProduct = value;
    });
  }

  late final _$updateSelectedCustomerBySerialAsyncAction = AsyncAction(
      '_DailySaleStore.updateSelectedCustomerBySerial',
      context: context);

  @override
  Future<void> updateSelectedCustomerBySerial(String serial) {
    return _$updateSelectedCustomerBySerialAsyncAction
        .run(() => super.updateSelectedCustomerBySerial(serial));
  }

  late final _$updateSelectedProductBySerialAsyncAction = AsyncAction(
      '_DailySaleStore.updateSelectedProductBySerial',
      context: context);

  @override
  Future<void> updateSelectedProductBySerial(String serial) {
    return _$updateSelectedProductBySerialAsyncAction
        .run(() => super.updateSelectedProductBySerial(serial));
  }

  late final _$_DailySaleStoreActionController =
      ActionController(name: '_DailySaleStore', context: context);

  @override
  void updateSelectedDate(DateTime date) {
    final _$actionInfo = _$_DailySaleStoreActionController.startAction(
        name: '_DailySaleStore.updateSelectedDate');
    try {
      return super.updateSelectedDate(date);
    } finally {
      _$_DailySaleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedCustomer(Customer? customer) {
    final _$actionInfo = _$_DailySaleStoreActionController.startAction(
        name: '_DailySaleStore.updateSelectedCustomer');
    try {
      return super.updateSelectedCustomer(customer);
    } finally {
      _$_DailySaleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedProduct(Product? product) {
    final _$actionInfo = _$_DailySaleStoreActionController.startAction(
        name: '_DailySaleStore.updateSelectedProduct');
    try {
      return super.updateSelectedProduct(product);
    } finally {
      _$_DailySaleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_DailySaleStoreActionController.startAction(
        name: '_DailySaleStore.reset');
    try {
      return super.reset();
    } finally {
      _$_DailySaleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate},
selectedCustomer: ${selectedCustomer},
selectedProduct: ${selectedProduct}
    ''';
  }
}
