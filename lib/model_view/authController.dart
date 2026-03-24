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
    print("EXHIBITOR RESPONSE: $data"); add 
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


}
