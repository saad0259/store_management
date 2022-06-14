class FunctionResponse {
  bool success;
  dynamic data;
  String message;
  int count;

  FunctionResponse({
    this.success = false,
    this.data,
    this.message = 'Could not process your request.',
    this.count = 0,
  });

  void passed({String? message}) {
    success = true;
    if (message != null) {
      this.message = message;
    }
  }

  void failed({String? message}) {
    success = false;
    if (message != null) {
      this.message = message;
    }
  }

  // @Deprecated('Use fResponse.failed(message: "' '")')
  void feedback(String _message) {
    message = _message;
  }

  void printResponse() {
    // ignore: avoid_print
    print(message);
  }
}
