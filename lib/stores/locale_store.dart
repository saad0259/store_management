import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'locale_store.g.dart';

class LocaleStore = _LocaleStoreBase with _$LocaleStore;

abstract class _LocaleStoreBase with Store {
  @observable
  Locale locale = const Locale('en');
  @action
  setLocale(Locale value) => locale = value;
}
