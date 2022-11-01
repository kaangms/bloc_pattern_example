import 'package:auto_route/auto_route.dart';
import 'package:bloc_pattern_example/product/routing/app_router.dart';

export 'app_route_handler.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    ...AppAutoRoute.routes,
    RedirectRoute(
      path: '*',
      //Todo:Splash eklersen burayı güncelle
      redirectTo: AppAutoRoute.user,
    ),
  ],
)
class $AppRouteHandler {}
