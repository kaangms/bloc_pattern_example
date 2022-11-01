// ignore_for_file: implementation_imports, unused_catch_stack

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/adapters/io_adapter.dart' as adapter;
import 'package:logger/logger.dart';

import '../../base/model/network/INetworkModel.dart';
import '../../base/model/network/IResponseModel.dart';
import '../../base/model/network/empty_model.dart';
import '../../base/model/network/error_model.dart';
import '../../base/model/network/response_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extensions/network_extensions.dart';

import 'INetworkService.dart';

part 'network_model_parser.dart';

class NetworkManager with DioMixin implements Dio, INetworkManager {
  NetworkManager({
    required BaseOptions options,
    bool? isEnableLogger,
    InterceptorsWrapper? interceptor,
    this.errorModel,
  }) {
    this.options = options;
    _addLoggerInterceptor(isEnableLogger ?? false);
    httpClientAdapter = adapter.createAdapter();
  }

  late INetworkModel? errorModel;

  @override
  Interceptors get dioIntercaptors => interceptors;

  void _addLoggerInterceptor(bool isEnableLogger) {
    if (isEnableLogger) interceptors.add(LogInterceptor());
  }

  @override
  void addBaseHeader(MapEntry<String, String> mapEntry) {
    options.headers[mapEntry.key] = mapEntry.value;
  }

  @override
  void clearHeader() {
    options.headers.clear();
  }

  @override
  void removeHeader(String key) {
    options.headers.remove(key);
  }

  @override
  Future<IResponseModel<R?>> send<T extends INetworkModel, R>(
    String path, {
    required T parseModel,
    required HttpRequestTypes method,
    String? urlSuffix = '',
    Map<String, dynamic>? queryParameters,
    Options? options,
    Duration? expiration,
    CancelToken? cancelToken,
    dynamic data,
    ProgressCallback? onReceiveProgress,
  }) async {
    options ??= Options();
    options.method = method.rawValue;
    options.contentType = 'application/json';
    final body = _getBodyModel(data);

    try {
      final response = await request('$path$urlSuffix', data: body, options: options, queryParameters: queryParameters);

      if (response.statusCode! >= HttpStatus.ok && response.statusCode! <= HttpStatus.multipleChoices) {
        return _getResponseResult<T, R>(response.data, parseModel, options);
      } else {
        return ResponseModel(error: ErrorModel(description: response.data.toString()));
      }
    } on DioError catch (e, s) {
      return _onError<R>(e);
    }
  }

  ResponseModel<R> _getResponseResult<T extends INetworkModel, R>(dynamic data, T parserModel, Options? options) {
    final model = _parseBody<R, T>(data, parserModel, options);
    return ResponseModel<R>(data: model);
  }

  ResponseModel<R> _onError<R>(DioError e) {
    final errorResponse = e.response;
    _printErrorMessage(e.message);
    final error = ErrorModel(description: e.message, statusCode: errorResponse != null ? errorResponse.statusCode : HttpStatus.internalServerError);
    if (errorResponse != null) {
      _generateErrorModel(error, errorResponse.data);
    }
    return ResponseModel<R>(error: error);
  }

  void _printErrorMessage(String message) {
    Logger().e(message);
  }

  void _generateErrorModel(ErrorModel error, dynamic data) {
    if (errorModel == null) return;
    final _data = data is Map ? data : jsonDecode(data);
    error.model = errorModel!.fromJson(_data);
  }
}
