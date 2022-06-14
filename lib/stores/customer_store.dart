import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../models/customer.dart';
import '../service_locator.dart';
import '../utils/function_response.dart';
part 'customer_store.g.dart';

class CustomerStore = _CustomerStore with _$CustomerStore;

abstract class _CustomerStore with Store {
  @observable
  ObservableList<Customer> customerList = ObservableList<Customer>.of([
    Customer(id: '123', serialNumber: 123, name: 'Saad'),
    Customer(id: '456', serialNumber: 456, name: 'Ahmed'),
    Customer(id: '789', serialNumber: 789, name: 'Ali'),
  ]);

  @action
  FunctionResponse addCustomer(Customer customer) {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      customerList.add(customer);
      fResponse.passed();
    } catch (e) {
      log(e.toString());
    }
    return fResponse;
  }

  @action
  void removeCustomer(Customer customer) {
    customerList.remove(customer);
  }
}
