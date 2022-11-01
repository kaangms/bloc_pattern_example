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

import '../../features/user/model/user_model.dart' as _i5;
import '../../features/user/view/user_view.dart' as _i1;
import '../../features/user_detail/view/user_detail_view.dart' as _i2;

class AppRouteHandler extends _i3.RootStackRouter {
  AppRouteHandler([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    UserViewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.UserView());
    },
    UserDetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailViewRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.UserDetailView(key: args.key, userModel: args.userModel));
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
class UserViewRoute extends _i3.PageRouteInfo<void> {
  const UserViewRoute({List<_i3.PageRouteInfo>? children})
      : super(UserViewRoute.name, path: '/user', initialChildren: children);

  static const String name = 'UserViewRoute';
}

/// generated route for
/// [_i2.UserDetailView]
class UserDetailViewRoute extends _i3.PageRouteInfo<UserDetailViewRouteArgs> {
  UserDetailViewRoute(
      {_i4.Key? key,
      required _i5.UserModel userModel,
      List<_i3.PageRouteInfo>? children})
      : super(UserDetailViewRoute.name,
            path: '/userDetail',
            args: UserDetailViewRouteArgs(key: key, userModel: userModel),
            initialChildren: children);

  static const String name = 'UserDetailViewRoute';
}

class UserDetailViewRouteArgs {
  const UserDetailViewRouteArgs({this.key, required this.userModel});

  final _i4.Key? key;

  final _i5.UserModel userModel;

  @override
  String toString() {
    return 'UserDetailViewRouteArgs{key: $key, userModel: $userModel}';
  }
}
