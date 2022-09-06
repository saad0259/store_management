import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/customer.dart';
import '../../models/daily_sale.dart';
import '../../models/product.dart';
import '../../repo/customer_repo.dart';
import '../../repo/daily_sale_repo.dart';
import '../../repo/product_repo.dart';
import '../../service_locator.dart';
import '../../state/daily_sale_store.dart';
import '../../utils/custom_alerts.dart';
import '../../utils/function_response.dart';

class DailySaleList extends StatelessWidget {
  DailySaleList({
    Key? key,
  }) : super(key: key);
  final DailySaleStore dailySaleStore = getIt<DailySaleStore>();
  final CustomAlerts customAlerts = getIt<CustomAlerts>();
  final DailySaleRepo dailySaleRepo = getIt<DailySaleRepo>();
  final CustomerRepo customerRepo = getIt<CustomerRepo>();
  final ProductRepo productRepo = getIt<ProductRepo>();

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
                  stream: dailySaleRepo.watchDailySales(),
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
                                      child: FutureBuilder(
                                        future: customerRepo.getCustomerById(
                                            currenItem.customerId),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          String name = '';
                                          if (snapshot.hasError ||
                                              !snapshot.hasData ||
                                              snapshot.data == null) {
                                          } else {
                                            final Customer customer =
                                                snapshot.data!;
                                            name = customer.name;
                                          }
                                          return Text(
                                            name,
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: FutureBuilder(
                                        future: productRepo.getProductById(
                                            currenItem.productId),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          String name = '';
                                          if (snapshot.hasError ||
                                              !snapshot.hasData ||
                                              snapshot.data == null) {
                                          } else {
                                            final Product product =
                                                snapshot.data!;
                                            name = product.name;
                                          }
                                          return Text(
                                            name,
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        currenItem.quantity.toString(),
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
                                              await dailySaleRepo
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
