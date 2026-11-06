// ignore: file_names
import 'package:news_app/core/network/api_consumer.dart';
import 'package:news_app/core/network/api_interceptors.dart';
import 'package:news_app/core/network/end_porints.dart';
import 'package:news_app/core/network/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends Api_consumer {
  Dio dio;
  DioConsumer(this.dio) {
    dio.options.connectTimeout = EndPoints.connectTimeout;
    dio.options.receiveTimeout = EndPoints.receiveTimeout;
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = EndPoints.baseUrl;
  }

  @override
  Future<dynamic> delete(
    url, {
    data,
    Map<String, dynamic>? query,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        url,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      exceptionTypes(e);
    }
  }

  @override
  Future<dynamic> get(
    url, {
    data,
    Map<String, dynamic>? query,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        url,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      exceptionTypes(e);
    }
  }

  @override
  Future<dynamic> patch(
    url, {
    data,
    Map<String, dynamic>? query,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        url,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      exceptionTypes(e);
    }
  }

  @override
  Future<dynamic> post(
    url, {
    dynamic data,
    Map<String, dynamic>? query,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: query,
      );

      return response.data;
    } on DioException catch (e) {
      exceptionTypes(e);
    }
  }
}
