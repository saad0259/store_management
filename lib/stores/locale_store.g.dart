// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocaleStore on _LocaleStoreBase, Store {
  late final _$localeAtom =
      Atom(name: '_LocaleStoreBase.locale', context: context);

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$dropDownValueAtom =
      Atom(name: '_LocaleStoreBase.dropDownValue', context: context);

  @override
  String get dropDownValue {
    _$dropDownValueAtom.reportRead();
    return super.dropDownValue;
  }

  @override
  set dropDownValue(String value) {
    _$dropDownValueAtom.reportWrite(value, super.dropDownValue, () {
      super.dropDownValue = value;
    });
  }

  late final _$_LocaleStoreBaseActionController =
      ActionController(name: '_LocaleStoreBase', context: context);

  @override
  dynamic setLocale(Locale value) {
    final _$actionInfo = _$_LocaleStoreBaseActionController.startAction(
        name: '_LocaleStoreBase.setLocale');
    try {
      return super.setLocale(value);
    } finally {
      _$_LocaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setdropDownValue(String value) {
    final _$actionInfo = _$_LocaleStoreBaseActionController.startAction(
        name: '_LocaleStoreBase.setdropDownValue');
    try {
      return super.setdropDownValue(value);
    } finally {
      _$_LocaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locale: ${locale},
dropDownValue: ${dropDownValue}
    ''';
  }
}
