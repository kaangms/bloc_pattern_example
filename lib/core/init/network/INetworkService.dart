// ignore_for_file: file_names

import 'package:dio/dio.dart';

import '../../base/model/network/INetworkModel.dart';
import '../../base/model/network/IResponseModel.dart';
import '../../constants/enums/http_request_enum.dart';

abstract class INetworkManager {
  Future<IResponseModel<R?>> send<T extends INetworkModel, R>(
    String path, {
    required T parseModel,
    required HttpRequestTypes method,
    String? urlSuffix,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Duration? expiration,
    CancelToken? cancelToken,
    dynamic data,
    ProgressCallback? onReceiveProgress,
  });

  Interceptors get dioIntercaptors;
  void addBaseHeader(MapEntry<String, String> key);
  void removeHeader(String key);
  void clearHeader();
}
