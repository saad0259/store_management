import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../db/db_helper/db_helper.dart';
import '../models/customer.dart';
import '../service_locator.dart';
import '../utils/function_response.dart';
part 'customer_store.g.dart';

class CustomerStore = _CustomerStore with _$CustomerStore;

abstract class _CustomerStore with Store {
  _CustomerStore(this.dbHelper);

  final DbHelper dbHelper;

  @observable
  ObservableList<Customer> customerList = ObservableList<Customer>.of([]);

  @action
  Stream<List<Customer>> watchCustomers() {
    return dbHelper.watchDbCustomers();
  }

  @action
  Future<FunctionResponse> addCustomer(Customer customer) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      log('Id I sent: ${customer.uid}');
      final int? dbId = await dbHelper.addOrUpdateDbCustomers(
        id: customer.uid,
        name: customer.name,
        createdAt: DateTime.now().toIso8601String(),
      );

      customerList.add(customer);
      fResponse.passed();
    } catch (e) {
      log(e.toString());
    }
    return fResponse;
  }

  @action
  Future<void> removeCustomer(Customer customer) async {
    final int? id = await dbHelper.addOrUpdateDbCustomers(
      id: customer.uid,
      serialNumber: customer.serialNumber,
      name: customer.name,
      createdAt: customer.createdAt.toIso8601String(),
      deletedAt: DateTime.now().toIso8601String(),
    );
    if (id != null) customerList.remove(customer);
  }
}
