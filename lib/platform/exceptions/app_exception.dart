

class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  String? getPrefix() => _prefix;
  String? getMessage() => _message;

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class CommunicationException extends AppException {
  CommunicationException([String? message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class NotFoundException extends AppException {
  NotFoundException([message]) : super(message, "Nothing found: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}