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

  late final _$dailySaleListAtom =
      Atom(name: '_DailySaleStore.dailySaleList', context: context);

  @override
  ObservableList<DailySale> get dailySaleList {
    _$dailySaleListAtom.reportRead();
    return super.dailySaleList;
  }

  @override
  set dailySaleList(ObservableList<DailySale> value) {
    _$dailySaleListAtom.reportWrite(value, super.dailySaleList, () {
      super.dailySaleList = value;
    });
  }

  late final _$addDailySaleAsyncAction =
      AsyncAction('_DailySaleStore.addDailySale', context: context);

  @override
  Future<FunctionResponse> addDailySale(DailySale dailySale) {
    return _$addDailySaleAsyncAction.run(() => super.addDailySale(dailySale));
  }

  late final _$removeDailySaleAsyncAction =
      AsyncAction('_DailySaleStore.removeDailySale', context: context);

  @override
  Future<void> removeDailySale(DailySale dailySale) {
    return _$removeDailySaleAsyncAction
        .run(() => super.removeDailySale(dailySale));
  }

  late final _$_DailySaleStoreActionController =
      ActionController(name: '_DailySaleStore', context: context);

  @override
  Stream<List<DailySale>> watchDailySales() {
    final _$actionInfo = _$_DailySaleStoreActionController.startAction(
        name: '_DailySaleStore.watchDailySales');
    try {
      return super.watchDailySales();
    } finally {
      _$_DailySaleStoreActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
selectedDate: ${selectedDate},
dailySaleList: ${dailySaleList}
    ''';
  }
}
