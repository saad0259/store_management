import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logging/logging.dart';

import 'daily_sale/add_daily_sale.dart';
import 'l10n/l10n.dart';
import 'service_locator.dart';
import 'stores/locale_store.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';
import 'view/customer/add_customer.dart';
import 'view/home/home_screen.dart';
import 'view/product/add_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  _setupLogging();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final LocaleStore localeStore = getIt<LocaleStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        //   brightness: Brightness.dark,
        // ),
        // theme: darkTheme(context),
        theme: lightTheme(context),
        supportedLocales: L10n().all,
        locale: localeStore.currentLocale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          ...GlobalCupertinoLocalizations.delegates,
        ],
        routes: {
          '/': (context) => HomeScreen(),
          AddCustomerScreen.routeName: (context) => AddCustomerScreen(),
          AddProductScreen.routeName: (context) => AddProductScreen(),
          AddDailySale.routeName: (context) => AddDailySale(),
        },
      );
    });
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
