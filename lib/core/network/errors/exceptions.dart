import 'package:news_app/core/network/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerExceptions implements Exception {
  final ErrorModel errorModel;

  ServerExceptions({required this.errorModel});
}

// ignore: non_constant_identifier_names
void exceptionTypes(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      // TODO: Handle this case.
      throw ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.sendTimeout:
      // TODO: Handle this case.
      throw ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.receiveTimeout: 
      // TODO: Handle this case.
      throw ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      throw ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.cancel:
      // TODO: Handle this case.
      throw ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.connectionError:
      // TODO: Handle this case.
      throw ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.unknown:
      // TODO: Handle this case.
      throw ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.transformTimeout:
      // TODO: Handle this case.
      throw ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data));
    case DioExceptionType.badResponse:
      // TODO: Handle this case.
      switch (e.response?.statusCode) {
        case 400: // Bad Request
          throw ServerExceptions(
            errorModel: ErrorModel.fromJson(e.response?.data),
          );

        case 401: //unauthorized
          throw ServerExceptions(
            errorModel: ErrorModel.fromJson(e.response?.data),
          );

        case 403: //forbidden
          throw ServerExceptions(
            errorModel: ErrorModel.fromJson(e.response?.data),
          );
        case 404: //not found
          throw ServerExceptions(
            errorModel: ErrorModel.fromJson(e.response?.data),
          );
        case 409: //conflict
          throw ServerExceptions(
            errorModel: ErrorModel.fromJson(e.response?.data),
          );

        case 422: //unprocessable entity
          throw ServerExceptions(
            errorModel: ErrorModel.fromJson(e.response?.data),
          );
        case 500: //internal server error
          throw ServerExceptions(
            errorModel: ErrorModel.fromJson(e.response?.data),
          );
        default:
          throw ServerExceptions(
            errorModel: ErrorModel.fromJson(e.response?.data),
          );
      }
  }
}
