import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../service_locator.dart';
import '../../../../utils/function_response.dart';
import '../../../../utils/reusable_widgets.dart';
import '../../../../view/reuseable/appbar.dart';
import '../../../../utils/custom_alerts.dart';
import '../../models/customer.dart';
import '../../models/daily_sale.dart';
import '../../models/product.dart';
import '../../repo/customer_repo.dart';
import '../../repo/daily_sale_repo.dart';
import '../../repo/product_repo.dart';
import '../../state/daily_sale_store.dart';
import '../../state/locale_store.dart';
import 'daily_sale_list.dart';

class AddDailySale extends StatelessWidget {
  AddDailySale({Key? key}) : super(key: key);
  static const routeName = '/add-daily-sale-screen';
  final DailySaleStore dailySaleStore = getIt<DailySaleStore>();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          dailySaleStore.reset();
          // Navigator.of(context).pop();
          return true;
        },
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
                  AddItemWidget(),
                  const VerticalDivider(
                    indent: 150,
                    endIndent: 100,
                  ),
                  DailySaleList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddItemWidget extends StatefulWidget {
  AddItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final TextEditingController nameController = TextEditingController();

  final DailySaleStore dailySaleStore = getIt<DailySaleStore>();
  final LocaleStore _localeStore = getIt<LocaleStore>();

  final CustomAlerts customAlerts = getIt<CustomAlerts>();

  final DailySaleRepo dailySaleRepo = getIt<DailySaleRepo>();
  final CustomerRepo customerRepo = getIt<CustomerRepo>();
  final ProductRepo productRepo = getIt<ProductRepo>();

  final TextEditingController quantityController = TextEditingController();

  final TextEditingController _customerTextEditingController =
      TextEditingController();
  final FocusNode _customerFieldFocus = FocusNode();
  final GlobalKey _customerAutocompleteKey = GlobalKey();

  Future<void> addDailySale(
      BuildContext context, AppLocalizations appLocale) async {
    final DailySale dailySale = DailySale(
      uid: DateTime.now().millisecondsSinceEpoch.toString(),
      date: dailySaleStore.selectedDate,
      customerId: dailySaleStore.selectedCustomer!.uid,
      productId: dailySaleStore.selectedProduct!.uid,
      serialNumber: DateTime.now().millisecondsSinceEpoch,
      quantity: int.tryParse(quantityController.text) ?? 1,
      pricePerItem: 0,
      subTotal: 0,
      marketFee: 0,
      total: 0,
      createdAt: DateTime.now(),
      deletedAt: null,
      syncedAt: null,
    );
    final FunctionResponse fResponse =
        await dailySaleRepo.addDailySale(dailySale);
    if (fResponse.success) {
      nameController.clear();
    }
    if (mounted) {
      customAlerts.showSnackBar(
          context,
          fResponse.success
              ? appLocale.dailySaleAddedSuccessfully
              : appLocale.error,
          success: fResponse.success);
    }
  }

  Future<void> changeDate() async {
    await DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2000, 3, 5),
        maxTime: DateTime(2100, 6, 7),
        onChanged: (date) {}, onConfirm: (date) {
      dailySaleStore.updateSelectedDate(date);
    },
        currentTime: dailySaleStore.selectedDate,
        locale: _localeStore.currentLocale == const Locale('en')
            ? LocaleType.en
            : LocaleType.ar);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocale = AppLocalizations.of(context)!;
    ThemeData theme = Theme.of(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Focus(
          // focusNode: _txtNode,
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
                appLocale.addDailySale,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 40),
              getDateField(theme),
              const SizedBox(height: 10),
              getProductField(theme),
              const SizedBox(height: 10),
              getCustomerField(theme, _customerAutocompleteKey,
                  _customerFieldFocus, _customerTextEditingController),
              const SizedBox(height: 10),
              getQuantityField(theme, quantityController),
              const SizedBox(height: 20),
              customElevatedButton(
                context,
                onPressed: () async {
                  await addDailySale(context, appLocale);
                  dailySaleStore.softReset();
                  quantityController.clear();
                },
                text: appLocale.addDailySale,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getQuantityField(ThemeData theme, TextEditingController quantityController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quantity',
          style: theme.textTheme.headline6?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: quantityController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelStyle: theme.textTheme.bodyText1,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget getProductField(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _getProductAutoFill(theme),
          // const SizedBox(width: 10),
          // _getProductBySerialWidget(theme),
        ],
      ),
    );
  }

  Expanded _getProductAutoFill(ThemeData theme) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product',
            style: theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          FutureBuilder<List<Product>>(
              future: productRepo.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.hasError ||
                    !snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const SizedBox();
                } else {
                  return LayoutBuilder(builder: (context, constraints) {
                    return Autocomplete<Product>(
                      displayStringForOption: (Product product) =>
                          '${product.serialNumber} - ${product.name}',
                      optionsViewBuilder: (context, onSelected, options) =>
                          Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            height: 52.0 * options.length,
                            width:
                                constraints.biggest.width, // <-- Right here !
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: options.length,
                              shrinkWrap: false,
                              itemBuilder: (BuildContext context, int index) {
                                final bool highlight =
                                    AutocompleteHighlightedOption.of(context) ==
                                        index;
                                if (highlight) {
                                  SchedulerBinding.instance
                                      .addPostFrameCallback(
                                          (Duration timeStamp) {
                                    Scrollable.ensureVisible(context,
                                        alignment: 0.5);
                                  });
                                }
                                final String name =
                                    '${options.elementAt(index).serialNumber} - ${options.elementAt(index).name}';
                                return InkWell(
                                  onTap: () =>
                                      onSelected(options.elementAt(index)),
                                  child: Container(
                                    color: highlight
                                        ? Colors.grey.shade200
                                        : Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        name,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<Product>.empty();
                        } else {
                          final List<Product> products = snapshot.data!;
                          return products.where((Product product) {
                            return product.name.toLowerCase().contains(
                                    textEditingValue.text.toLowerCase()) ||
                                product.serialNumber
                                    .toString()
                                    .toLowerCase()
                                    .contains(
                                        textEditingValue.text.toLowerCase());
                          });
                        }
                      },
                      onSelected: (Product product) {
                        dailySaleStore.updateSelectedProduct(product);
                      },
                    );
                  });
                }
              }),
        ],
      ),
    );
  }

  // Widget _getProductBySerialWidget(ThemeData theme) {
  //   return Expanded(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Code',
  //           style: theme.textTheme.headline6?.copyWith(
  //             fontWeight: FontWeight.bold,
  //             fontSize: 16,
  //           ),
  //         ),
  //         const SizedBox(height: 10),
  //         TextField(
  //           decoration: const InputDecoration(counterText: ''),
  //           inputFormatters: [
  //             FilteringTextInputFormatter.digitsOnly,
  //           ],
  //           maxLength: 6,
  //           onChanged: (String value) async {
  //             if (value.isEmpty) {
  //               dailySaleStore.updateSelectedProduct(null);
  //             } else if (int.tryParse(value) != null) {
  //               await dailySaleStore.updateSelectedProductBySerial(value);
  //             }
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget getCustomerField(
    ThemeData theme,
    GlobalKey customerKey,
    FocusNode customerFocusNode,
    TextEditingController customerController,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _getCustomerAutoFill(
              theme, customerKey, customerFocusNode, customerController),
          // const SizedBox(width: 10),
          // _getCustomerBySerialWidget(theme),
        ],
      ),
    );
  }

  static String _displayStringForOption(Customer customer) =>
      '${customer.serialNumber} -  ${customer.name}';
  Expanded _getCustomerAutoFill(
    ThemeData theme,
    GlobalKey customerKey,
    FocusNode customerFocusNode,
    TextEditingController customerController,
  ) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer',
            style: theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          FutureBuilder<List<Customer>>(
              future: customerRepo.getCustomers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.hasError ||
                    !snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const SizedBox();
                } else {
                  return Observer(builder: (_) {
                    return LayoutBuilder(builder: (context, constraints) {
                      return Autocomplete<Customer>(
                        key: customerKey,
                        // focusNode: _customerFieldFocus,
                        // textEditingController: customerController,
                        initialValue: TextEditingValue(
                            text: dailySaleStore.selectedCustomer?.name ?? ''),
                        displayStringForOption: _displayStringForOption,
                        optionsViewBuilder: (context, onSelected, options) =>
                            Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              height: 52.0 * options.length,
                              width:
                                  constraints.biggest.width, // <-- Right here !
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: options.length,
                                shrinkWrap: false,
                                itemBuilder: (BuildContext context, int index) {
                                  final bool highlight =
                                      AutocompleteHighlightedOption.of(
                                              context) ==
                                          index;
                                  if (highlight) {
                                    SchedulerBinding.instance
                                        .addPostFrameCallback(
                                            (Duration timeStamp) {
                                      Scrollable.ensureVisible(context,
                                          alignment: 0.5);
                                    });
                                  }
                                  final String name =
                                      '${options.elementAt(index).serialNumber} - ${options.elementAt(index).name}';
                                  return InkWell(
                                    onTap: () =>
                                        onSelected(options.elementAt(index)),
                                    child: Container(
                                      color: highlight
                                          ? Colors.grey.shade200
                                          : Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          name,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<Customer>.empty();
                          } else {
                            final List<Customer> customers = snapshot.data!;
                            return customers.where((Customer customer) {
                              return customer.name.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase()) ||
                                  customer.serialNumber
                                      .toString()
                                      .toLowerCase()
                                      .contains(
                                          textEditingValue.text.toLowerCase());
                            });
                          }
                        },
                        onSelected: (Customer customer) {
                          dailySaleStore.updateSelectedCustomer(customer);
                          debugPrint(
                              'You just selected ${_displayStringForOption(customer)}');
                        },
                      );
                    });
                  });
                }
              }),
        ],
      ),
    );
  }

  // Widget _getCustomerBySerialWidget(ThemeData theme) {
  //   return Expanded(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Code',
  //           style: theme.textTheme.headline6?.copyWith(
  //             fontWeight: FontWeight.bold,
  //             fontSize: 16,
  //           ),
  //         ),
  //         const SizedBox(height: 10),
  //         TextField(
  //           decoration: const InputDecoration(counterText: ''),
  //           inputFormatters: [
  //             FilteringTextInputFormatter.digitsOnly,
  //           ],
  //           maxLength: 6,
  //           onChanged: (String value) async {
  //             // dailySaleStore.updateCode(value);
  //             if (value.isEmpty) {
  //               dailySaleStore.updateSelectedCustomer(null);
  //             } else if (int.tryParse(value) != null) {
  //               await dailySaleStore.updateSelectedCustomerBySerial(value);
  //             }
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget getDateField(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // const SizedBox(width: 0),
        Text(
          'Date',
          style:
              theme.textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
        ),
        Observer(builder: (_) {
          return InkWell(
            onTap: () async {
              await changeDate();
            },
            child: Text(
              DateFormat('d MMM y').format(dailySaleStore.selectedDate),
              style: theme.textTheme.headline6,
            ),
          );
        }),
        IconButton(
            onPressed: () async {
              await changeDate();
            },
            icon: const Icon(Icons.calendar_month)),
      ],
    );
  }
}
