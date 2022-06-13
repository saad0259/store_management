import 'package:flutter/material.dart';

import '../../customer/add_customer.dart';
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
                    icon: const Icon(Icons.receipt_rounded),
                    text: appLocale.addCustomer,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AddCustomerScreen.routeName);
                    }),
                _customButtonWidget(
                    icon: const Icon(Icons.receipt_rounded),
                    text: appLocale.greeting,
                    onTap: () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _customButtonWidget(
                    icon: const Icon(Icons.receipt_rounded),
                    text: appLocale.greeting,
                    onTap: () {}),
                _customButtonWidget(
                    icon: const Icon(Icons.receipt_rounded),
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
