import 'dart:developer';

import '../db/db_helper/db_helper.dart';
import '../models/customer.dart';
import '../service_locator.dart';
import '../utils/function_response.dart';

class CustomerRepo {
  CustomerRepo(this.dbHelper);
  final DbHelper dbHelper;

  // static final CustomerRepo instance = CustomerRepo();
  Stream<List<Customer>> watchCustomers() {
    return dbHelper.watchDbCustomers();
  }

  //get customers from db
  Future<List<Customer>> getCustomers() async {
    return await dbHelper.watchDbCustomers().first;
  }

  //get customer by id
  Future<Customer?> getCustomerById(String id) async {
    return await dbHelper.getCustomerById(int.parse(id));
  }

  //get customer by serial
  Future<Customer?> getCustomerBySerial(String serial) async {
    return await dbHelper.getCustomerBySerial(int.parse(serial));
  }

  Future<FunctionResponse> addCustomer(String name) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      final Customer customer = Customer(
        uid: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        createdAt: DateTime.now(),
      );
      final int? dbId = await dbHelper.addOrUpdateDbCustomers(customer);

      fResponse.passed();
    } catch (e) {
      log(e.toString());
    }
    return fResponse;
  }

  Future<void> removeCustomer(Customer customer) async {
    final Customer deleteCustomer = Customer(
      uid: customer.uid,
      name: customer.name,
      serialNumber: customer.serialNumber,
      createdAt: customer.createdAt,
      deletedAt: DateTime.now(),
      syncedAt: customer.syncedAt,
    );
    final int? id = await dbHelper.addOrUpdateDbCustomers(deleteCustomer);
  }
}
