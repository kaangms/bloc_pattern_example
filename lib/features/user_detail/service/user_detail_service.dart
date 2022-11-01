import 'package:bloc_pattern_example/core/constants/enums/http_request_enum.dart';

import '../../../core/init/network/INetworkService.dart';
import '../../../product/enum/network_route_enum.dart';
import '../model/user_detail_model.dart';

abstract class IUserDetailService {
  late final INetworkManager _networkManager;

  IUserDetailService(INetworkManager networkManager) : _networkManager = networkManager;

  Future<UserDetailModel> fetchUserDetail(String userId);
}

class UserDetailService extends IUserDetailService {
  UserDetailService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<UserDetailModel> fetchUserDetail(String userId) async {
    final response = await _networkManager.send<UserDetailModel, UserDetailModel>(
      NetworkRoutes.USER_DETAIL.rawValue,
      parseModel: UserDetailModel(),
      method: HttpRequestTypes.GET,
      urlSuffix: '/$userId',
    );

    return response.data ?? UserDetailModel();
  }
}
