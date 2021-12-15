class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  AppException({this.message, this.prefix, this.url});
}

class BadRequestException extends AppException {
  BadRequestException(String message, String url) : super(message: message, prefix: 'Bad Request', url: url);
}

class FetchDataException extends AppException {
  FetchDataException(String message, String url) : super(message: message, prefix: 'Unable to process', url: url);
}

class FetchDataException2 extends AppException {
  FetchDataException2(String message, String url) : super(message: message, prefix: 'Unable to process data', url: url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException(String message, String url)
      : super(message: message, prefix: 'Api not responded in time', url: url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(String message, String url) : super(message: message, prefix: 'UnAuthorized Request', url: url);
}
