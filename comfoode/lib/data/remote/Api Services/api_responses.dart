class Success {
  int? code;
  dynamic response;
  Success({this.code, required this.response});
}

class Failure {
  int code;
  dynamic errorResponse;
  Failure({required this.code, required this.errorResponse});
}
