import 'package:get_it/get_it.dart';

import 'l10n/l10n.dart';
import 'stores/customer_store.dart';
import 'stores/locale_store.dart';
import 'utils/custom_alerts.dart';
import 'utils/function_response.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton(() => L10n());
  //Custom Utils
  getIt.registerFactory(() => CustomAlerts());
  getIt.registerFactory(() => FunctionResponse());
  //Stores
  getIt.registerLazySingleton(() => LocaleStore());
  getIt.registerLazySingleton(() => CustomerStore());
}
