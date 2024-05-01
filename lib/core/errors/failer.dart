import 'package:dio/dio.dart';

abstract class Failer {
  final String message;

  Failer({required this.message});
}

class ServerFailure extends Failer {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          message: 'It took too much time to connect to the server',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          message: 'It took too much time to send data to the server',
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          message: 'It took too much time to receive data from the server',
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          message: 'there is an error with the certificate',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!);
      case DioExceptionType.cancel:
        return ServerFailure(
          message: 'the request was cancelled',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          message: 'there is an error with the connection',
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          message: 'something went wrong with the server',
        );
    }
  }
  factory ServerFailure.fromResponse(Response response) {
    if (response.statusCode == 404) {
      return ServerFailure(
        message: 'your request not found, please try later',
      );
    } else if (response.statusCode == 500) {
      return ServerFailure(
        message: 'Internal Server Error',
      );
    } else if (response.statusCode == 400 || response.statusCode == 401 || response.statusCode == 403) {
      return ServerFailure(
        message: response.data['error']['message'],
      );
    
    }
    else {
      return ServerFailure(message: 'oops there was an error, please try again');
    }
    }
  
  }

