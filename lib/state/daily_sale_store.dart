import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../models/customer.dart';
import '../models/product.dart';
import '../repo/customer_repo.dart';
import '../repo/product_repo.dart';
part 'daily_sale_store.g.dart';

class DailySaleStore = _DailySaleStore with _$DailySaleStore;

abstract class _DailySaleStore with Store {
  _DailySaleStore(this.customerRepo, this.productRepo);
  final CustomerRepo customerRepo;
  final ProductRepo productRepo;

  @observable
  DateTime selectedDate = DateTime.now();
  @observable
  Customer? selectedCustomer;
  @observable
  Product? selectedProduct;

  @action
  void updateSelectedDate(DateTime date) {
    selectedDate = date;
  }

  @action
  void updateSelectedCustomer(Customer? customer) {
    selectedCustomer = customer;
  }

  @action
  Future<void> updateSelectedCustomerBySerial(String serial) async {
    final Customer? customer = await customerRepo.getCustomerBySerial(serial);
    updateSelectedCustomer(customer);
  }

  @action
  void updateSelectedProduct(Product? product) {
    selectedProduct = product;
  }

  @action
  Future<void> updateSelectedProductBySerial(String serial) async {
    final Product? product = await productRepo.getProductBySerial(serial);
    updateSelectedProduct(product);
  }

  @action
  void reset() {
    selectedDate = DateTime.now();
    selectedCustomer = null;
    selectedProduct = null;
  }

  @action
  void softReset() {
    selectedCustomer = null;
  }
}
