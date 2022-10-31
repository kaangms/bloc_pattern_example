import '../../../core/init/network/INetworkService.dart';
import '../model/user_model.dart';

enum _UserServicePath { products, categories }

abstract class IUserService {
  late final INetworkManager _networkManager;

  IUserService(INetworkManager networkManager) : _networkManager = networkManager;

  Future<List<UserModel>?> fetchUsers();
}

class UserService extends IUserService {
  UserService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<UserModel>?> fetchUsers() {
    // TODO: implement fetchUsers
    throw UnimplementedError();
  }
}
