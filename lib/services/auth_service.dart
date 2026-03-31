import 'package:dio/dio.dart';
import '../api/dio_client.dart';
import '../api/api_constants.dart';

class AuthService {
  final Dio _dio = DioClient.dio;

  //visitorlogin
  Future<Response> visitorLogin({
    required String userId,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.visitorLogin,
        data: {
          "UserID": userId,
          "password": password,
          "DeviceId": "123456",
          "blIOS": "false",
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //exhibitor login
  Future<Response> exhibitorLogin({required String userId}) async {
    final response = await _dio.get(
      ApiConstants.exhibitorLogin,
      queryParameters: {"EmailId": userId},
    );

    return response;
  }

  //visitorForgetPassword
  Future<Response> visitorForgetPassword({
    required String inId,
    required String password,
  }) async {
    final response = await _dio.post(
      ApiConstants.forgotPassword,
      data: {"InId": inId, "Password": password},
    );
    return response;
  }

  //DBMSLogin
  Future<Response> dbsmlogin({
    required String userId,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.dbsmLogin,
        data: {
          "UserID": userId,
          "password": password,
          "DeviceId": "123456",
          "blIOS": "false",
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //RBMSLogin
  Future<Response> rbsmlogin({
    required String userId,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.rbsmLogin,
        data: {
          "UserID": userId,
          "password": password,
          "DeviceId": "123456",
          "blIOS": "false",
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //iotLogin
  Future<Response> iotlogin({
    required String userId,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.iotLogin,
        data: {
          "UserID": userId,
          "password": password,
          "DeviceId": "123456",
          "blIOS": "false",
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
