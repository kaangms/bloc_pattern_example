// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../features/user/view/user_view.dart' as _i1;
import '../../features/user_detail/view/user_detail_view.dart' as _i2;

class AppRouteHandler extends _i3.RootStackRouter {
  AppRouteHandler([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    UserViewRoute.name: (routeData) {
      final args = routeData.argsAs<UserViewRouteArgs>(
          orElse: () => const UserViewRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.UserView(key: args.key));
    },
    UserDetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailViewRouteArgs>(
          orElse: () => const UserDetailViewRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.UserDetailView(key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/user', fullMatch: true),
        _i3.RouteConfig(UserViewRoute.name, path: '/user', children: [
          _i3.RouteConfig('*#redirect',
              path: '*',
              parent: UserViewRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i3.RouteConfig(UserDetailViewRoute.name,
            path: '/userDetail',
            children: [
              _i3.RouteConfig('*#redirect',
                  path: '*',
                  parent: UserDetailViewRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '/user', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.UserView]
class UserViewRoute extends _i3.PageRouteInfo<UserViewRouteArgs> {
  UserViewRoute({_i4.Key? key, List<_i3.PageRouteInfo>? children})
      : super(UserViewRoute.name,
            path: '/user',
            args: UserViewRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'UserViewRoute';
}

class UserViewRouteArgs {
  const UserViewRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'UserViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.UserDetailView]
class UserDetailViewRoute extends _i3.PageRouteInfo<UserDetailViewRouteArgs> {
  UserDetailViewRoute({_i4.Key? key, List<_i3.PageRouteInfo>? children})
      : super(UserDetailViewRoute.name,
            path: '/userDetail',
            args: UserDetailViewRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'UserDetailViewRoute';
}

class UserDetailViewRouteArgs {
  const UserDetailViewRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'UserDetailViewRouteArgs{key: $key}';
  }
}
