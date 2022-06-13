import 'package:get_it/get_it.dart';

import 'l10n/l10n.dart';
import 'stores/locale_store.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton(() => L10n());
  getIt.registerLazySingleton(() => LocaleStore());
}
