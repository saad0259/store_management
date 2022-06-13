import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../view/reuseable/appbar.dart';

class AddCustomerScreen extends StatelessWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);
  static const routeName = '/add-customer-screen';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: GlobalAppBar(
          screenHeight: screenHeight,
          backwardsCompatibility: true,
        ),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddCustomerWidget(),
                const VerticalDivider(
                  indent: 150,
                  endIndent: 100,
                ),
                CustomersList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomersList extends StatelessWidget {
  const CustomersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(),
      ),
    );
  }
}

class AddCustomerWidget extends StatelessWidget {
  const AddCustomerWidget({
    Key? key,
  }) : super(key: key);

  Future<void> addCustomer() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocale = AppLocalizations.of(context)!;

    return Expanded(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(appLocale.addCustomer,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Add'))),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
