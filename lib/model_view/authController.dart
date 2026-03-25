import 'package:get/get.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _service = AuthService();

  var isLoading = false.obs;

  Future<void> visitorlogin(String user, String pass) async {
    try {
      isLoading.value = true;
      final response = await _service.visitorLogin(
        userId: user,
        password: pass,
      );
      final data = response.data;
      print("API RESPONSE: $data");
      if (data["Code"] == 1) {
        Get.snackbar("Success", "Login Successful");
      } else {
        Get.snackbar("Error", data["Message"]);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> exhibitorLogin(String email) async {
    try {
      isLoading.value = true;
      final response = await _service.exhibitorLogin(email: email);
      final data = response.data;
      print("EXHIBITOR RESPONSE: $data");
      if (data["Code"] == 1) {
        Get.snackbar("Success", "Login Successful");
      } else {
        Get.snackbar("Error", data["Message"] ?? "Login Failed");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> visitorForgetPassword(String inId, String password) async {
    try {
      isLoading.value = true;
      final response = await _service.visitorForgetPassword(
        inId: inId,
        password: password,
      );

      final data = response.data;
      print("FORGOT PASSWORD RESPONSE: $data");

      if (data["Code"] == 1) {
        Get.snackbar("Success", data["Message"] ?? "Password Updated");
      } else {
        Get.snackbar("Error", data["Message"] ?? "Failed");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> dbsmLogin(String user, String pass) async {
    try {
      isLoading.value = true;
      final response = await _service.dbsmlogin(
        userId: user,
        password: pass,
      );
      final data = response.data;
      print("API RESPONSE: $data");
      if (data["Code"] == 1) {
        Get.snackbar("Success", "Login Successful");
      } else {
        Get.snackbar("Error", data["Message"]);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

   Future<void> rbsmLogin(String user, String pass) async {
    try {
      isLoading.value = true;
      final response = await _service.rbsmlogin(
        userId: user,
        password: pass,
      );
      final data = response.data;
      print("API RESPONSE: $data");
      if (data["Code"] == 1) {
        Get.snackbar("Success", "Login Successful");
      } else {
        Get.snackbar("Error", data["Message"]);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

   Future<void> iotLogin(String user, String pass) async {
    try {
      isLoading.value = true;
      final response = await _service.iotlogin(
        userId: user,
        password: pass,
      );
      final data = response.data;
      print("API RESPONSE: $data");
      if (data["Code"] == 1) {
        Get.snackbar("Success", "Login Successful");
      } else {
        Get.snackbar("Error", data["Message"]);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
