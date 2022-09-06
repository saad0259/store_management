import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:store_management/l10n/l10n.dart';

import '../../service_locator.dart';
import '../../state/locale_store.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  GlobalAppBar(
      {Key? key,
      required this.backwardsCompatibility,
      required this.screenHeight})
      : super(key: key);
  final bool backwardsCompatibility;
  final double screenHeight;
  final LocaleStore localeStore = getIt<LocaleStore>();
  @override
  Size get preferredSize => Size.fromHeight(screenHeight * 0.08);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: LanguagePicker(
            localeStore: localeStore,
          ),
        ),
      ],
    );
  }
}

class LanguagePicker extends StatelessWidget {
  LanguagePicker({Key? key, required this.localeStore}) : super(key: key);
  final LocaleStore localeStore;
  final L10n l10n = getIt<L10n>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return DropdownButton<Locale>(
        value: localeStore.currentLocale,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 16,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (Locale? newValue) {
          localeStore.currentLocale = newValue ?? l10n.all.first;
        },
        items: l10n.all.map<DropdownMenuItem<Locale>>((Locale value) {
          return DropdownMenuItem<Locale>(
            value: value,
            child: Text(value.languageCode),
          );
        }).toList(),
      );
    });
  }
}
