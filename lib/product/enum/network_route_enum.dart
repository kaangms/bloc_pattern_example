// ignore_for_file: constant_identifier_names

enum NetworkRoutes {
  USERS,

  USER_DETAIL
}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.USERS:
        return 'users';
      case NetworkRoutes.USER_DETAIL:
        return 'userdetail';

      default:
        throw Exception('Routes not found');
    }
  }
}
