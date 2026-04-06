import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/models/exhibitorModel.dart';
import 'package:n_gauge_apptask/models/visitorModel.dart';
import 'package:n_gauge_apptask/services/hiveservice.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _service = Get.find<AuthService>();
  final Hiveservice _hive = Get.find<Hiveservice>();
  var exhibitor = Rxn<Record>();
  var visitor = Rxn<VisitorRecord>();

  var isLoading = false.obs;

  bool isLoggedIn() {
    return _hive.isloggedIn();
  }

  String getRole() {
    return _hive.getRole() ?? '';
  }

  void setLoggedInUser(String role) {
    _hive.saveRole(role);
    _hive.setLoggedIn(true);
  }

  void saveUserEmail(String email) {
    _hive.saveUserEmail(email);
  }

  String? getUserEmail() {
    return _hive.getUserEmail();
  }

  void logout() {
    _hive.loggout();
  }

  Future<bool> visitorlogin(String user, String pass) async {
    try {
      isLoading.value = true;
      final response = await _service.visitorLogin(
        userId: user.trim(),
        password: pass.trim(),
      );
      final data = response.data;
      final code = data["Code"];
      final isSuccess = code == 1 || code == "1" || code == true;

      if (isSuccess) {
        print('Login successful, saving credentials...');
        print('Saving userId: $user');
        print('Saving password: $pass');
        saveUserEmail(user.trim()); // Save userId for visitor
        _hive.saveUserPassword(pass.trim()); // Save password for visitor
        setLoggedInUser('visitor');
        Get.snackbar("Success", "Login Successful");
        return true;
      } else {
        final message =
            data["Message"] ?? data["message"] ?? "Enter valid id and password";
        Get.snackbar(
          "Error",
          message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Network or server error",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> rbsmLogin(String user, String pass) async {
    try {
      isLoading.value = true;
      final response = await _service.rbsmlogin(userId: user, password: pass);
      final data = response.data;
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> iotLogin(String user, String pass) async {
    try {
      isLoading.value = true;
      final response = await _service.iotlogin(userId: user, password: pass);
      final data = response.data;
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
    } finally {
      isLoading.value = false;
    }
  }

  //visitor details
  Future<bool> getVisitorDetails(String userId) async {
    try {
      isLoading.value = true;
      print('Fetching visitor details for userId: $userId');

      final password = _hive.getUserPassword() ?? '';
      print('Retrieved password from Hive: "$password"');
      print('Password is empty: ${password.isEmpty}');

      final data = await _service.fetchVisitorDetails(userId, password);

      if (data != null) {
        print('Visitor details fetched successfully');
        visitor.value = data;
        return true;
      }

      print('Visitor details returned null');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  //
  //exhibitor details
  Future<bool> getExhibitorDetails(String email) async {
    try {
      isLoading.value = true;

      final data = await _service.fetchExhibitorDetails(email);

      if (data != null) {
        exhibitor.value = data;
        return true;
      }

      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
