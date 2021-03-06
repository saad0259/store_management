import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../service_locator.dart';
import '../../utils/function_response.dart';
import '../../utils/reusable_widgets.dart';
import '../../view/reuseable/appbar.dart';
import '../../utils/custom_alerts.dart';
import '../models/daily_sale.dart';
import '../stores/daily_sale_store.dart';

class AddDailySale extends StatelessWidget {
  AddDailySale({Key? key}) : super(key: key);
  static const routeName = '/add-daily-sale-screen';
  final DailySaleStore dailySaleStore = getIt<DailySaleStore>();

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
                AddItemWidget(),
                const VerticalDivider(
                  indent: 150,
                  endIndent: 100,
                ),
                DailySaleList(dailySaleStore: dailySaleStore),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DailySaleList extends StatelessWidget {
  DailySaleList({
    Key? key,
    required this.dailySaleStore,
  }) : super(key: key);
  final DailySaleStore dailySaleStore;
  final CustomAlerts customAlerts = getIt<CustomAlerts>();

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
              appLocale.recentDailySales,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<List<DailySale>>(
                  stream: dailySaleStore.watchDailySales(),
                  builder: (context, snapshot) {
                    return (snapshot.hasError ||
                            !snapshot.hasData ||
                            snapshot.data == null)
                        ? Center(
                            child: Text(
                              appLocale.noDailySaleFound,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          )
                        : ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final DailySale currenItem =
                                  snapshot.data![index];

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
                                        currenItem.customerId,
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
                                              dailySaleStore
                                                  .removeDailySale(currenItem);
                                            }

                                            customAlerts.showSnackBar(
                                                context,
                                                fResponse.success
                                                    ? 'Deleted Succesfull'
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
  final CustomAlerts customAlerts = getIt<CustomAlerts>();

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

  Future<void> addDailySale(
      BuildContext context, AppLocalizations appLocale) async {
    final DailySale dailySale = DailySale(
      uid: DateTime.now().millisecondsSinceEpoch.toString(),
      date: dailySaleStore.selectedDate,
      customerId: '',
      productId: '',
      serialNumber: DateTime.now().millisecondsSinceEpoch,
      quantity: 0,
      pricePerItem: 0,
      subTotal: 0,
      marketFee: 0,
      total: 0,
      createdAt: DateTime.now(),
      deletedAt: null,
      isSynced: false,
    );
    final FunctionResponse fResponse =
        await dailySaleStore.addDailySale(dailySale);
    if (fResponse.success) {
      nameController.clear();
    }
    customAlerts.showSnackBar(
        context,
        fResponse.success
            ? appLocale.dailySaleAddedSuccessfully
            : appLocale.error,
        success: fResponse.success);
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
                appLocale.addDailySale,
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
              const SizedBox(height: 20),
              Observer(builder: (_) {
                return TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2100, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        dailySaleStore.updateSelectedDate(date);
                        print('confirm $date');
                      },
                          currentTime: dailySaleStore.selectedDate,
                          locale: LocaleType.en);
                    },
                    child: Text(
                      'show date time picker',
                      style: TextStyle(color: Colors.blue),
                    ));
              }),
              const SizedBox(height: 40),
              customElevatedButton(
                context,
                onPressed: () async {
                  await addDailySale(context, appLocale);
                },
                text: appLocale.addDailySale,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
