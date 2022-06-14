import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/customer.dart';
import '../service_locator.dart';
import '../stores/customer_store.dart';
import '../utils/function_response.dart';
import '../utils/reusable_widgets.dart';
import '../view/reuseable/appbar.dart';
import '../../utils/custom_alerts.dart';

class AddCustomerScreen extends StatelessWidget {
  AddCustomerScreen({Key? key}) : super(key: key);
  static const routeName = '/add-customer-screen';
  final CustomerStore customerStore = getIt<CustomerStore>();

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
                CustomersList(customerStore: customerStore),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomersList extends StatelessWidget {
  CustomersList({
    Key? key,
    required this.customerStore,
  }) : super(key: key);
  final CustomerStore customerStore;
  final CustomAlerts customAlerts = getIt<CustomAlerts>();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocale = AppLocalizations.of(context)!;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Observer(builder: (_) {
          return Column(
            children: [
              const SizedBox(height: 50),
              Text(
                appLocale.recentTransactions,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: customerStore.customerList.isEmpty
                    ? Center(
                        child: Text(
                          appLocale.noCustomerFound,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      )
                    : ListView.builder(
                        itemCount: customerStore.customerList.length,
                        itemBuilder: (context, index) {
                          final Customer currenItem =
                              customerStore.customerList[index];
                          return Card(
                            // color: Colors.red,
                            key: ValueKey(currenItem.id),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    currenItem.serialNumber.toString(),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    currenItem.name,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        FunctionResponse fResponse =
                                            await customAlerts.confirmDelete(
                                                context: context);
                                        if (fResponse.success) {
                                          customerStore
                                              .removeCustomer(currenItem);
                                        }

                                        customAlerts.showSnackBar(
                                            context,
                                            fResponse.success
                                                ? 'Deleted Customer'
                                                : 'Error ');
                                      },
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          );
                        }),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class AddCustomerWidget extends StatelessWidget {
  AddCustomerWidget({
    Key? key,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  final CustomerStore customerStore = getIt<CustomerStore>();
  final CustomAlerts customAlerts = getIt<CustomAlerts>();

  Future<void> addCustomer(
      BuildContext context, AppLocalizations appLocale) async {
    final Customer customer = Customer(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: nameController.text,
      serialNumber: DateTime.now().millisecondsSinceEpoch,
    );
    final FunctionResponse fResponse = customerStore.addCustomer(customer);
    if (fResponse.success) {
      nameController.clear();
    }
    customAlerts.showSnackBar(
        context,
        fResponse.success
            ? appLocale.customerAddedSuccessfully
            : appLocale.error,
        success: fResponse.success);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocale = AppLocalizations.of(context)!;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              appLocale.addCustomer,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        nameController.clear();
                      },
                      icon: const Icon(Icons.close))),
            ),
            const SizedBox(height: 40),
            customElevatedButton(
              context,
              onPressed: () async {
                await addCustomer(context, appLocale);
              },
              text: appLocale.addCustomer,
            ),
          ],
        ),
      ),
    );
  }
}
