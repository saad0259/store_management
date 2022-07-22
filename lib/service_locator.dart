import 'package:get_it/get_it.dart';

import 'db/database.dart';
import 'db/db_helper/db_helper.dart';
import 'l10n/l10n.dart';
import 'stores/customer_store.dart';
import 'stores/daily_sale_store.dart';
import 'stores/locale_store.dart';
import 'stores/product_store.dart';
import 'utils/custom_alerts.dart';
import 'utils/function_response.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton(() => L10n());

  //Custom Utils
  getIt.registerFactory(() => CustomAlerts());
  getIt.registerFactory(() => FunctionResponse());

  //DB

  getIt.registerLazySingleton(() => MyAppDb());
  getIt.registerLazySingleton(() => DbHelper(
        getIt<MyAppDb>(),
      ));

  //Stores
  getIt.registerLazySingleton(() => LocaleStore());
  getIt.registerLazySingleton(() => CustomerStore(
        getIt<DbHelper>(),
      ));
  getIt.registerLazySingleton(() => ProductStore(
        getIt<DbHelper>(),
      ));

  getIt.registerLazySingleton(() => DailySaleStore(
        getIt<DbHelper>(),
      ));
}
