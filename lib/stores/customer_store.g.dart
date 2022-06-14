// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerStore on _CustomerStore, Store {
  late final _$customerListAtom =
      Atom(name: '_CustomerStore.customerList', context: context);

  @override
  ObservableList<Customer> get customerList {
    _$customerListAtom.reportRead();
    return super.customerList;
  }

  @override
  set customerList(ObservableList<Customer> value) {
    _$customerListAtom.reportWrite(value, super.customerList, () {
      super.customerList = value;
    });
  }

  late final _$_CustomerStoreActionController =
      ActionController(name: '_CustomerStore', context: context);

  @override
  FunctionResponse addCustomer(Customer customer) {
    final _$actionInfo = _$_CustomerStoreActionController.startAction(
        name: '_CustomerStore.addCustomer');
    try {
      return super.addCustomer(customer);
    } finally {
      _$_CustomerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCustomer(Customer customer) {
    final _$actionInfo = _$_CustomerStoreActionController.startAction(
        name: '_CustomerStore.removeCustomer');
    try {
      return super.removeCustomer(customer);
    } finally {
      _$_CustomerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customerList: ${customerList}
    ''';
  }
}
