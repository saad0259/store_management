import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/customer.dart';
import '../../repo/customer_repo.dart';
import '../../service_locator.dart';
import '../../state/customer_store.dart';
import '../../utils/function_response.dart';
import '../../utils/reusable_widgets.dart';
import '../../view/reuseable/appbar.dart';
import '../../utils/custom_alerts.dart';

class AddCustomerScreen extends StatelessWidget {
  AddCustomerScreen({Key? key}) : super(key: key);
  static const routeName = '/add-customer-screen';
  final CustomerRepo customerRepo = getIt<CustomerRepo>();
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
                CustomersList(customerRepo: customerRepo),
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
    required this.customerRepo,
  }) : super(key: key);
  final CustomAlerts customAlerts = getIt<CustomAlerts>();
  final CustomerRepo customerRepo;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocale = AppLocalizations.of(context)!;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              appLocale.recentCustomers,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<List<Customer>>(
                  stream: customerRepo.watchCustomers(),
                  builder: (context, snapshot) {
                    return (snapshot.hasError ||
                            !snapshot.hasData ||
                            snapshot.data == null)
                        ? Center(
                            child: Text(
                              appLocale.noCustomerFound,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          )
                        : ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final Customer currenItem = snapshot.data![index];

                              return Card(
                                key: ValueKey(currenItem.uid),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5.0),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        currenItem.serialNumber.toString(),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
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
                                                await customAlerts
                                                    .confirmDelete(
                                                        context: context);
                                            if (fResponse.success) {
                                              customerRepo
                                                  .removeCustomer(currenItem);
                                            }

                                            customAlerts.showSnackBar(
                                                context,
                                                fResponse.success
                                                    ? 'Deleted Customer'
                                                    : 'Delete failed',
                                                success: fResponse.success);
                                          },
                                        ),
                                      ],
                                    )
                                  ]),
                                ),
                              );
                            });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCustomerWidget extends StatefulWidget {
  AddCustomerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCustomerWidget> createState() => _AddCustomerWidgetState();
}

class _AddCustomerWidgetState extends State<AddCustomerWidget> {
  final TextEditingController nameController = TextEditingController();

  final CustomAlerts customAlerts = getIt<CustomAlerts>();
  final CustomerRepo customerRepo = getIt<CustomerRepo>();

  late FocusNode _txtNode;

  @override
  void initState() {
    super.initState();
    _txtNode = FocusNode();
  }

  @override
  void dispose() {
    _txtNode.dispose();
    super.dispose();
  }

  Future<void> addCustomer(
      BuildContext context, AppLocalizations appLocale) async {
    final FunctionResponse fResponse =
        await customerRepo.addCustomer(nameController.text);
    if (fResponse.success) {
      nameController.clear();
    }
    if (mounted) {
      customAlerts.showSnackBar(
          context,
          fResponse.success
              ? appLocale.customerAddedSuccessfully
              : appLocale.error,
          success: fResponse.success);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocale = AppLocalizations.of(context)!;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Focus(
          focusNode: _txtNode,
          onKey: (focusNode, event) {
            if (event.runtimeType == RawKeyUpEvent &&
                event.logicalKey == LogicalKeyboardKey.enter) {
              focusNode.nextFocus();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                appLocale.addCustomer,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              TextFormField(
                autofocus: true,
                controller: nameController,
                decoration: InputDecoration(
                    labelText: appLocale.name,
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
      ),
    );
  }
}
