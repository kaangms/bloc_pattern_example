import 'package:auto_route/auto_route.dart';
import 'package:bloc_pattern_example/features/user/view/user_view.dart';
import 'package:bloc_pattern_example/features/user_detail/view/user_detail_view.dart';

class AppAutoRoute {
  static const user = '/user';
  static const userDetail = '/userDetail';
  static const List<AutoRoute> routes = [
    userRoute,
    userDetailRoute,
  ];
  static const AutoRoute userRoute = AutoRoute(
    name: 'UserViewRoute',
    initial: true,
    path: user,
    page: UserView,
    children: [
      RedirectRoute(
        path: '*',
        redirectTo: '',
      ),
    ],
  );

  static const AutoRoute userDetailRoute = AutoRoute(
    name: 'UserDetailViewRoute',
    path: userDetail,
    page: UserDetailView,
    children: [
      RedirectRoute(
        path: '*',
        redirectTo: '',
      ),
    ],
  );
}
