import 'package:get_it/get_it.dart';

import '../routing/app_route_handler.gr.dart';

final locator = GetIt.instance;

void setupGetItLocators() {
  locator.registerLazySingleton<AppRouteHandler>(
    () => AppRouteHandler(),
  );
}
