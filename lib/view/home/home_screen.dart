import 'package:flutter/material.dart';

import '../daily_sale/add_daily_sale.dart';
import '../customer/add_customer.dart';
import '../product/add_product.dart';
import '../reuseable/appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final AppLocalizations appLocale = AppLocalizations.of(context)!;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: GlobalAppBar(
            backwardsCompatibility: false, screenHeight: screenHeight),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _customButtonWidget(
                    icon: const Icon(
                      Icons.person_add_alt_1,
                      size: 50,
                    ),
                    text: appLocale.addCustomer,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AddCustomerScreen.routeName);
                    }),
                _customButtonWidget(
                    icon: const Icon(
                      Icons.apple,
                      size: 50,
                    ),
                    text: appLocale.addItem,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AddProductScreen.routeName);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _customButtonWidget(
                  icon: const Icon(
                    Icons.receipt_rounded,
                    size: 50,
                  ),
                  text: appLocale.addDailySale,
                  onTap: () {
                    Navigator.of(context).pushNamed(AddDailySale.routeName);
                  },
                ),
                _customButtonWidget(
                    icon: const Icon(
                      Icons.receipt_rounded,
                      size: 50,
                    ),
                    text: appLocale.greeting,
                    onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InkWell _customButtonWidget(
      {required Icon icon, required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 20),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
