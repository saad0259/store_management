import 'package:mobx/mobx.dart';

part 'customer_store.g.dart';

class CustomerStore = _CustomerStore with _$CustomerStore;

abstract class _CustomerStore with Store {}
