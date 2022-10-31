import 'package:bloc_pattern_example/core/constants/enums/http_request_enum.dart';

import '../../../core/init/network/INetworkService.dart';
import '../../../product/enum/network_route_enum.dart';
import '../model/user_model.dart';

abstract class IUserService {
  late final INetworkManager _networkManager;

  IUserService(INetworkManager networkManager) : _networkManager = networkManager;

  Future<List<UserModel>> fetchUsers();
}

class UserService extends IUserService {
  UserService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<UserModel>> fetchUsers() async {
    final response = await _networkManager.send<UserModel, List<UserModel>>(
      NetworkRoutes.USERS.rawValue,
      parseModel: UserModel(),
      method: HttpRequestTypes.GET,
    );

    return response.data ?? <UserModel>[];
  }
}
