class BaseException {
  String? message;

  BaseException({this.message});

  BaseException.statusCode(int statusCode) {
    switch (statusCode) {
      case 404:
        throw BaseException(message: "File Not Found");
        break;
      case 500:
        throw BaseException(message: "Internal Server Error");
        break;

      default: throw BaseException(message: "Something wrong try again");
    }
  }
}
