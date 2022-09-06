import 'package:get_it/get_it.dart';

import 'db/database.dart';
import 'db/db_helper/db_helper.dart';
import 'l10n/l10n.dart';
import 'repo/customer_repo.dart';
import 'repo/daily_sale_repo.dart';
import 'repo/product_repo.dart';
import 'state/customer_store.dart';
import 'state/daily_sale_store.dart';
import 'state/locale_store.dart';
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

  //Repo
  getIt.registerFactory(() => CustomerRepo(
        getIt<DbHelper>(),
      ));
  getIt.registerLazySingleton(() => DailySaleRepo(
        getIt<DbHelper>(),
      ));
  getIt.registerLazySingleton(() => ProductRepo(
        getIt<DbHelper>(),
      ));

  //Stores
  getIt.registerLazySingleton(() => LocaleStore());
  getIt.registerLazySingleton(() => CustomerStore());

  getIt.registerLazySingleton(() => DailySaleStore(
        getIt<CustomerRepo>(),
        getIt<ProductRepo>(),
      ));
}
