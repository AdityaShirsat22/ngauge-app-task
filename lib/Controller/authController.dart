import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/services/hiveservice.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _service = Get.find<AuthService>();
  final Hiveservice _hive = Get.find<Hiveservice>();

  var isLoading = false.obs;

  Future<bool> login(String user, String pass, String role) async {
    try {
      isLoading.value = true;

      final response = role == "visitor"
          ? await _service.visitorLogin(userId: user, password: pass)
          : await _service.exhibitorLogin(userId: user);

      if (response.data["Code"] == 1) {
        _hive.saveRole(role);
        _hive.setLoggedIn(true);
        return true;
      }

      return false;
    } catch (e) {
      return false;
    } finally {
      isLoading.value = false;
    }
  }

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
        Get.defaultDialog(
          title: "Error",
          middleText: data["Message"],
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text("Retry", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
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
      final response = await _service.exhibitorLogin(userId: email);
      final data = response.data;
      print("EXHIBITOR RESPONSE: $data");
      if (data["Code"] == 1) {
        Get.snackbar("Success", "Login Successful");
      } else {
        Get.defaultDialog(
          title: "Error",
          titleStyle: TextStyle(color: Colors.red),

          middleText: data["Message"] ?? "Login Failed",
          middleTextStyle: TextStyle(fontSize: 17),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text("Retry", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: e.toString());
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
      final response = await _service.dbsmlogin(userId: user, password: pass);
      final data = response.data;
      print("API RESPONSE: $data");
      if (data["Code"] == 1) {
        Get.snackbar("Success", "Login Successful");
      } else {
        Get.defaultDialog(
          title: "Error",
          titleStyle: TextStyle(color: Colors.red),

          middleText: data["Message"] ?? "Login Failed",
          middleTextStyle: TextStyle(fontSize: 17),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text("Retry", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
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
      final response = await _service.rbsmlogin(userId: user, password: pass);
      final data = response.data;
      print("API RESPONSE: $data");
      if (data["Code"] == 1) {
        Get.snackbar("Success", "Login Successful");
      } else {
        Get.defaultDialog(
          title: "Error",
          titleStyle: TextStyle(color: Colors.red),

          middleText: data["Message"] ?? "Login Failed",
          middleTextStyle: TextStyle(fontSize: 17),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text("Retry", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
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
      final response = await _service.iotlogin(userId: user, password: pass);
      final data = response.data;
      print("API RESPONSE: $data");
      if (data["Code"] == 1) {
        Get.snackbar("Success", "Login Successful");
      } else {
        Get.defaultDialog(
          title: "Error",
          titleStyle: TextStyle(color: Colors.red),

          middleText: data["Message"] ?? "Login Failed",
          middleTextStyle: TextStyle(fontSize: 17),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text("Retry", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
