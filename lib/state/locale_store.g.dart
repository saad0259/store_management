// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocaleStore on _LocaleStoreBase, Store {
  late final _$currentLocaleAtom =
      Atom(name: '_LocaleStoreBase.currentLocale', context: context);

  @override
  Locale get currentLocale {
    _$currentLocaleAtom.reportRead();
    return super.currentLocale;
  }

  @override
  set currentLocale(Locale value) {
    _$currentLocaleAtom.reportWrite(value, super.currentLocale, () {
      super.currentLocale = value;
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
  String toString() {
    return '''
currentLocale: ${currentLocale}
    ''';
  }
}
