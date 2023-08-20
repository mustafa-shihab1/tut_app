enum DataSource {
  SUCCESS,
  CREATED,
  ACCEPTED,
  CANCEL,
  NO_CONTENT,
  BAD_REQUEST,
  UNAUTHORIZED,
  FORBIDDEN,
  SEND_TIMEOUT,
  UNKNOWN,
  NOT_FOUND,
  RECIEVE_TIMEOUT,
  CONNECT_TIMEOUT,
  METHOD_NOT_ALLOWED,
  CONFLICT,
  INTERNAL_SERVER_ERROR,
  BAD_GATEWAY,
  CACHE_ERROR,
  SERVICE_UNAVAILABLE,
  GATEWAY_TIMEOUT,
  NO_INTERNET_CONNECTION,
}

class ResponseCode{
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int INTERNAL_SERVER_ERROR = 500;

  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int UNKNOWN = -7;
}

class ResponseMessage{
  static const String SUCCESS = "Success";
  static const String NO_CONTENT = "Success (No Content)";
  static const String BAD_REQUEST = "Bad Request";
  static const String UNAUTHORIZED = "User is Unauthorized";
  static const String FORBIDDEN = "Forbidden";
  static const String INTERNAL_SERVER_ERROR = "Internal Server Error";

  static const String CONNECT_TIMEOUT = "Connection Timeout";
  static const String CANCEL = "Request Cancelled";
  static const String RECIEVE_TIMEOUT = "Receive Timeout";
  static const String SEND_TIMEOUT = "Send Timeout";
  static const String CACHE_ERROR = "Cache Error";
  static const String NO_INTERNET_CONNECTION = "Please check your internet connection";
  static const String UNKNOWN = "Something went wrong";
}

