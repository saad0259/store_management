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
        locale: localeStore.locale,
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



// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key, required this.localeStore}) : super(key: key);
//   final LocaleStore localeStore;

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;

//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Demo'),
//         actions: [
//           LanguagePicker(
//             localeStore: localeStore,
//           )
//         ],
//       ),
//       body: SizedBox(
//         width: screenWidth,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const LanguageWidget(),
//             const SizedBox(height: 20),
//             Text(
//               AppLocalizations.of(context)!.language,
//             ),
//             const SizedBox(height: 20),
//             Text(AppLocalizations.of(context)!.greeting)
//           ],
//         ),
//       ),
//     ));
//   }
// }

// class LanguageWidget extends StatelessWidget {
//   const LanguageWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Locale locale = Localizations.localeOf(context);
//     final flag = L10n.getFlag(locale.languageCode);
//     return Center(
//       child: CircleAvatar(
//           backgroundColor: Colors.blue.shade300,
//           radius: 72,
//           child: Text(
//             flag,
//             style: const TextStyle(fontSize: 72),
//           )),
//     );
//   }
// }

// class LanguagePicker extends StatelessWidget {
//   const LanguagePicker({Key? key, required this.localeStore}) : super(key: key);
//   final LocaleStore localeStore;

//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (_) {
//       return DropdownButton<Locale>(
//         value: localeStore.locale,
//         icon: const Icon(Icons.arrow_downward),
//         iconSize: 24,
//         elevation: 16,
//         style: const TextStyle(color: Colors.deepPurple),
//         underline: Container(
//           height: 2,
//           color: Colors.deepPurpleAccent,
//         ),
//         onChanged: (Locale? newValue) {
//           localeStore.locale = newValue ?? L10n().all.first;
//         },
//         items: L10n().all.map<DropdownMenuItem<Locale>>((Locale value) {
//           return DropdownMenuItem<Locale>(
//             value: value,
//             child: Text(value.languageCode),
//           );
//         }).toList(),
//       );
//     });
//   }
// }
