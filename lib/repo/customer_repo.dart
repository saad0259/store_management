import '../db/db_helper/db_helper.dart';
import '../models/customer.dart';
import '../service_locator.dart';

class CustomerRepo {
  CustomerRepo(this.dbHelper);
  final DbHelper dbHelper;

  // static final CustomerRepo instance = CustomerRepo();
  Stream<List<Customer>> watchCustomers() {
    return dbHelper.watchDbCustomers();
  }
}
