import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'l10n/l10n.dart';
import 'stores/locale_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LocaleStore localeStore = LocaleStore();
    // final LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Observer(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        supportedLocales: L10n().all,
        locale: localeStore.locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          ...GlobalCupertinoLocalizations.delegates,
        ],
        home: MyHomePage(
          localeStore: localeStore,
        ),
      );
    });
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.localeStore}) : super(key: key);
  final LocaleStore localeStore;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        actions: [
          LanguagePicker(
            localeStore: localeStore,
          )
        ],
      ),
      body: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LanguageWidget(),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.language,
            ),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.greeting)
          ],
        ),
      ),
    ));
  }
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Locale locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);
    return Center(
      child: CircleAvatar(
          backgroundColor: Colors.blue.shade300,
          radius: 72,
          child: Text(
            flag,
            style: const TextStyle(fontSize: 72),
          )),
    );
  }
}

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key, required this.localeStore}) : super(key: key);
  final LocaleStore localeStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return DropdownButton<Locale>(
        value: localeStore.locale,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (Locale? newValue) {
          localeStore.locale = newValue ?? L10n().all.first;
        },
        items: L10n().all.map<DropdownMenuItem<Locale>>((Locale value) {
          return DropdownMenuItem<Locale>(
            value: value,
            child: Text(value.languageCode),
          );
        }).toList(),
      );
    });
  }
}
