import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'locale_store.g.dart';

class LocaleStore = _LocaleStoreBase with _$LocaleStore;

abstract class _LocaleStoreBase with Store {
  @observable
  Locale locale = const Locale('en');
  @action
  setLocale(Locale value) => locale = value;

  @observable
  String dropDownValue = 'One';
  @action
  setdropDownValue(String value) => dropDownValue = value;

  List<String> numbers = ['One', 'Two', 'Free', 'Four'];
}
