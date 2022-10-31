import '../constants/enums/http_request_enum.dart';

extension NetworkTypeExtension on HttpRequestTypes {
  String get rawValue {
    switch (this) {
      case HttpRequestTypes.GET:
        return 'GET';
      case HttpRequestTypes.POST:
        return 'POST';
      case HttpRequestTypes.DELETE:
        return 'DELETE';
      case HttpRequestTypes.PUT:
        return 'PUT';
      default:
        throw 'Request Type Not Found';
    }
  }
}
