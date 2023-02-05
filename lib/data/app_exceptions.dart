class AppExceptions implements Exception {
  dynamic _message;
  dynamic _prefix;

  AppExceptions([this._message, this._prefix]);

  String getString() {
    return "$_message$_prefix";
  }
}

class FetchedDataExceptions extends AppExceptions {
  FetchedDataExceptions([String? message])
      : super(message, "Error During Communicataion");
}

class BedRequestExceptions extends AppExceptions {
  BedRequestExceptions([String? message]) : super(message, "Invalid Request !");
}

class UnAuthorizedExceptions extends AppExceptions {
  UnAuthorizedExceptions([String? message])
      : super(message, "UnAthurized Request !");
}

class InvalidInputExceptions extends AppExceptions {
  InvalidInputExceptions([String? message]) : super(message, "Invalid Input !");
}
