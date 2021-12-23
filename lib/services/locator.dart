import 'package:astrotak/notifiers/astrologer_notifier.dart';
import 'package:astrotak/services/astrologer_service.dart';
import 'package:get_it/get_it.dart';
import 'package:astrotak/controller/theme_controller.dart';
import 'package:astrotak/notifiers/product_notifier.dart';
import 'package:astrotak/router/app_router.dart';
import 'package:astrotak/services/product_service.dart';
import 'package:astrotak/services/theme_pref_service.dart';
import 'package:astrotak/services/theme_service.dart';

import 'logger.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  Stopwatch stopwatch = Stopwatch()..start();
  locator.registerFactory<ThemeController>(() => ThemeController());
  locator.registerFactory<ProductNotifier>(() => ProductNotifier());
  locator.registerFactory<AstrologerNotifier>(() => AstrologerNotifier());
  locator.registerSingleton<AppRouter>(AppRouter());
  locator.registerLazySingleton<ThemeService>(() => ThemeServicePrefs());
  locator.registerLazySingleton<ProductService>(() => ProductService());
  locator.registerLazySingleton<AstrologerService>(() => AstrologerService());
  logger.d('Locator setup took ${stopwatch.elapsedMilliseconds} ms');
  stopwatch.stop();
}
