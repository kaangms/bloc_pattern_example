import 'package:bloc_pattern_example/core/init/network/app_network_manager.dart';
import 'package:bloc_pattern_example/features/user/service/user_service.dart';
import 'package:bloc_pattern_example/features/user_detail/service/user_detail_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late IUserService userService;
  late IUserDetailService userDetailService;
  setUp(() {
    userService = UserService(AppNetworkManager.instance.networkManager);
    userDetailService = UserDetailService(AppNetworkManager.instance.networkManager);
  });
  test('fetchUsers - test all elements ', () async {
    final response = await userService.fetchUsers();
    expect(response, isNotEmpty);
  });
  test('fetchUserDetail - test all elements ', () async {
    var users = await userService.fetchUsers();
    for (var user in users) {
      expect(user, isNotNull);
      expect(user.id, isNotNull);
      final response = await userDetailService.fetchUserDetail(user.id!);
      expect(response, isNotNull);
      expect(response.userid, user.id);
    }
  });
}
