import 'package:bloc_pattern_example/product/constants/aplication_constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../routing/app_route_handler.gr.dart';
import '../routing/app_router.dart';
import '../routing/navigator/bloc/navigation_bloc.dart';
import 'app_dependency_injection.dart';

final routeObserver = RouteObserver<MaterialPageRoute>();

class AppBlocProviders extends StatefulWidget {
  const AppBlocProviders({Key? key}) : super(key: key);

  @override
  _AppBlocProvidersState createState() => _AppBlocProvidersState();
}

class _AppBlocProvidersState extends State<AppBlocProviders> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (context, state) async {
          if (state is OpenUserView) {
            await locator<AppRouteHandler>().replaceNamed(AppAutoRoute.user);
          } else if (state is OpenUserDetailView) {
            await locator<AppRouteHandler>().push(UserDetailViewRoute(userModel: state.userModel));
          }
        },
        builder: (context, navigationState) {
          return MaterialApp.router(
            title: ApplicationConstats.instance.appName,
            theme: ThemeData(),
            debugShowCheckedModeBanner: false,
            routeInformationParser: locator<AppRouteHandler>().defaultRouteParser(),
            routerDelegate: locator<AppRouteHandler>().delegate(
              navigatorObservers: () => [
                routeObserver,
              ],
            ),
            builder: (context, router) => router!,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
