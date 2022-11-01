import 'package:bloc_pattern_example/core/constants/enums/http_request_enum.dart';

import '../../../core/init/network/INetworkService.dart';
import '../../../product/enum/network_route_enum.dart';
import '../model/user_detail_model.dart';

abstract class IUserDetailService {
  late final INetworkManager _networkManager;

  IUserDetailService(INetworkManager networkManager) : _networkManager = networkManager;

  Future<UserDetailModel> fetchUserDetail();
}

class UserDetailService extends IUserDetailService {
  UserDetailService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<UserDetailModel> fetchUserDetail() async {
    final response = await _networkManager.send<UserDetailModel, UserDetailModel>(
      NetworkRoutes.USERS.rawValue,
      parseModel: UserDetailModel(),
      method: HttpRequestTypes.GET,
    );

    return response.data ?? UserDetailModel();
  }
}
