class Success {
  int code;
  dynamic response;
  Success(this.code, this.response);
}

class Failure {
  int code;
  dynamic errorResponse;
  Failure(this.code, this.errorResponse);
}
