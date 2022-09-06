import 'dart:developer';

import '../db/db_helper/db_helper.dart';
import '../models/customer.dart';
import '../models/daily_sale.dart';
import '../service_locator.dart';
import '../utils/function_response.dart';

class DailySaleRepo {
  DailySaleRepo(this.dbHelper);
  final DbHelper dbHelper;

  Stream<List<DailySale>> watchDailySales() {
    return dbHelper.watchDbDailySales();
  }

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
        syncedAt: dailySale.syncedAt?.toIso8601String(),
        createdAt: DateTime.now().toIso8601String(),
      );

      fResponse.passed();
    } catch (e) {
      log(e.toString());
    }
    return fResponse;
  }

  Future<void> removeDailySale(DailySale dailySale) async {
    final int? id = await dbHelper.addOrUpdateDailySales(
      id: dailySale.uid,
      serialNumber: dailySale.serialNumber,
      date: dailySale.date.toIso8601String(),
      customerId: dailySale.customerId,
      productId: dailySale.productId,
      quantity: dailySale.quantity,
      pricePerItem: dailySale.pricePerItem,
      subTotal: dailySale.subTotal,
      marketFee: dailySale.marketFee,
      total: dailySale.total,
      createdAt: dailySale.createdAt.toIso8601String(),
      deletedAt: DateTime.now().toIso8601String(),
      syncedAt: dailySale.syncedAt == null
          ? null
          : dailySale.syncedAt!.toIso8601String(),
    );
  }
}
