import 'package:dio/dio.dart';
import 'package:n_gauge_apptask/models/exhibitorModel.dart';
import 'package:n_gauge_apptask/models/visitorModel.dart';
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
        queryParameters: {
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

  Future<Record?> fetchExhibitorDetails(String email) async {
    try {
      final response = await _dio.get(
        ApiConstants.exhibitorLogin,
        queryParameters: {"EmailId": email.trim()},
      );

      final model = Exhibitormodel.fromJson(response.data);

      if (model.records != null && model.records!.isNotEmpty) {
        return model.records!.first;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  Future<VisitorRecord?> fetchVisitorDetails(
    String userId,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.visitorLogin,
        queryParameters: {
          "UserID": userId.trim(),
          "password": password.trim(),
          "DeviceId": "123456",
          "blIOS": "false",
        },
      );

      print('API Response: ${response.data}');
      print('Response Code: ${response.statusCode}');

      // Parse the response as a VisitorRecord directly (not wrapped in a model)
      final visitorRecord = VisitorRecord.fromJson(response.data);

      print('Parsed VisitorRecord - Email: ${visitorRecord.emailId}');

      if (visitorRecord.emailId != null && visitorRecord.emailId!.isNotEmpty) {
        return visitorRecord;
      }

      return null;
    } catch (e) {
      print('Error fetching visitor details: $e');
      return null;
    }
  }
}
