import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../db/db_helper/db_helper.dart';
import '../models/daily_sale.dart';
import '../service_locator.dart';
import '../utils/function_response.dart';
part 'daily_sale_store.g.dart';

class DailySaleStore = _DailySaleStore with _$DailySaleStore;

abstract class _DailySaleStore with Store {
  _DailySaleStore(this.dbHelper);

  final DbHelper dbHelper;

  @observable
  DateTime selectedDate = DateTime.now();

  @observable
  ObservableList<DailySale> dailySaleList = ObservableList<DailySale>.of([]);

  @action
  Stream<List<DailySale>> watchDailySales() {
    return dbHelper.watchDbDailySales();
  }

  @action
  Future<FunctionResponse> addDailySale(DailySale dailySale) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      final int? dbId = await dbHelper.addOrUpdateDailySales(
        id: dailySale.uid,
        date: dailySale.date.toIso8601String(),
        customerId: dailySale.customerId,
        productId: dailySale.productId,
        quantity: dailySale.quantity,
        pricePerItem: dailySale.pricePerItem,
        subTotal: dailySale.subTotal,
        marketFee: dailySale.marketFee,
        total: dailySale.total,
        isSynced: dailySale.isSynced,
        createdAt: DateTime.now().toIso8601String(),
      );

      dailySaleList.add(dailySale);
      fResponse.passed();
    } catch (e) {
      log(e.toString());
    }
    return fResponse;
  }

  @action
  Future<void> removeDailySale(DailySale dailySale) async {
    final int? id = await dbHelper.addOrUpdateDailySales(
      id: dailySale.uid,
      date: dailySale.date.toIso8601String(),
      customerId: dailySale.customerId,
      productId: dailySale.productId,
      quantity: dailySale.quantity,
      pricePerItem: dailySale.pricePerItem,
      subTotal: dailySale.subTotal,
      marketFee: dailySale.marketFee,
      total: dailySale.total,
      isSynced: dailySale.isSynced,
      createdAt: dailySale.createdAt.toIso8601String(),
      deletedAt: DateTime.now().toIso8601String(),
    );
    if (id != null) dailySaleList.remove(dailySale);
  }

  @action
  void updateSelectedDate(DateTime date) {
    selectedDate = date;
  }
}
