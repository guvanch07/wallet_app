import 'dart:convert';

import 'package:http/http.dart' as http;

class ServerException implements Exception {
  dynamic message;
  ServerException([this.message]);
}

class CacheException implements Exception {}

class ConfirmCodeException implements Exception {}

class CreateUserException implements Exception {}

class GetUserProfileException implements Exception {}

class ToManyRequestsException implements Exception {}

class BadRequestException implements Exception {
  dynamic message;
  BadRequestException([this.message]);
}

class NotFoundException implements Exception {
  dynamic message;
  NotFoundException([this.message]);
}

class PasswordMismatchException implements Exception {
  /// account_password_mismatch
}

class AccountNotFoundException implements Exception {
  /// account_not_found server response
}

class WrongEmailException implements Exception {
  /// must_be_valid_email_address server response
}

class EmailAlreadyBeenTakenException implements Exception {
  /// has_already_been_taken
}

class CreateOwnProjectException implements Exception {}

class FetchVocabulariesException implements Exception {}

class FetchDataException implements Exception {}

class UnauthorisedException implements Exception {}

class LocalAuthenificationException implements Exception {}

Map<String, dynamic> _response(http.Response response) {
  // log('⚙️ \x1B[35mstatus ${response.statusCode}, body: ${response.body.toString()}',
  //     name: 'RESPONSE');
  switch (response.statusCode) {
    case 200:
      Map<String, dynamic> responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 404:
      throw NotFoundException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException();

    case 500:
    default:
      throw FetchDataException();
  }
}
