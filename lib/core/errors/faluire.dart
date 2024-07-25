import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.errMessage});
  factory FirebaseFailure.fromFirebaseAuth(String authException) {
    switch (authException) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case 'account-exists-with-different-credential':
      case "email-already-in-use":
      case "[firebase_auth/email-already-in-use] The email address is already in use by another account.":
        return FirebaseFailure(
            errMessage: "Email already used. Go to login page.");

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
      case "invalid-credential":
      case "[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.":
        return FirebaseFailure(errMessage: "Wrong email/password combination.");

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return FirebaseFailure(errMessage: "No user found with this email.");
      case 'weak-password':
        return FirebaseFailure(errMessage: "weak Password please try again");
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return FirebaseFailure(errMessage: "User disabled.");

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return FirebaseFailure(
            errMessage: "Too many requests to log into this account.");

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return FirebaseFailure(
            errMessage: "Server error, please try again later.");

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
      case "[firebase_auth/invalid-email] The email address is badly formatted.":
        return FirebaseFailure(errMessage: "Email address is invalid.");
      case "[firebase_auth/weak-password] Password should be at least 6 characters":
        return FirebaseFailure(
            errMessage: "Password should be at least 6 characters");
      default:
        return FirebaseFailure(errMessage: "Login failed. Please try again.");
    }
  }
}

class ServerFaliure extends Failure {
  ServerFaliure({required super.errMessage});
  factory ServerFaliure.fromDioErr(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure(errMessage: 'Connection time out with the server');
      case DioExceptionType.cancel:
        return ServerFaliure(errMessage: 'Request to server was cancled');
      case DioExceptionType.connectionError:
        return ServerFaliure(errMessage: 'Connection time out with the server');
      case DioExceptionType.sendTimeout:
        return ServerFaliure(
            errMessage:
                'send time out with the server, please try again later!');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure(
            errMessage:
                'recieve time out with the server, please try again later!');
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponce(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFaliure(errMessage: 'No Internet Connection');
        }
        return ServerFaliure(
            errMessage: 'Un Expected Error please try again later');
      default:
        return ServerFaliure(
            errMessage: 'Oops there was an error, please try again later!');
    }
  }
  factory ServerFaliure.fromResponce(int statusCode, dynamic responce) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(errMessage: responce['error']['message']);
    } else if (statusCode == 404) {
      return ServerFaliure(
          errMessage: 'Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFaliure(
          errMessage: 'Internal server proplem, please try again later!');
    } else {
      return ServerFaliure(
          errMessage: 'Oops there was an error, please try again later!');
    }
  }
}
