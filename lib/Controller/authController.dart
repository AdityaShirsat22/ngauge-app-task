import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/models/exhibitorModel.dart';
import 'package:n_gauge_apptask/services/hiveservice.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _service = Get.find<AuthService>();
  final Hiveservice _hive = Get.find<Hiveservice>();
  var exhibitor = Rxn<Record>();

  var isLoading = false.obs;

  // Future<bool> login(String user, String pass, String role) async {
  //   try {
  //     isLoading.value = true;

  //     final response = role == "visitor"
  //         ? await _service.visitorLogin(
  //             userId: user.trim(),
  //             password: pass.trim(),
  //             deviceId: '123456',
  //           )
  //         : await _service.exhibitorLogin(userId: user.trim());

  //     final code = response.data["Code"];
  //     final message =
  //         response.data["Message"] ??
  //         response.data["message"] ??
  //         "Login failed";
  //     final isSuccess = code == 1 || code == "1" || code == true;

  //     if (isSuccess) {
  //       _hive.saveRole(role);
  //       _hive.setLoggedIn(true);
  //       return true;
  //     }

  //     Get.snackbar(
  //       'Error',
  //       message.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.redAccent,
  //       colorText: Colors.white,
  //     );

  //     return false;
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Network or server error',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.redAccent,
  //       colorText: Colors.white,
  //     );
  //     return false;
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<bool> visitorlogin(String user, String pass) async {
    try {
      isLoading.value = true;
      final response = await _service.visitorLogin(
        userId: user.trim(),
        password: pass.trim(),
      );
      final data = response.data;
      print("API RESPONSE: $data");
      final code = data["Code"];
      final isSuccess = code == 1 || code == "1" || code == true;

      if (isSuccess) {
        _hive.saveRole('visitor');
        _hive.setLoggedIn(true);
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
      print(e.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> exhibitorLogin(String email) async {
  //   try {
  //     isLoading.value = true;
  //     final response = await _service.exhibitorLogin(userId: email);
  //     final data = response.data;
  //     print("EXHIBITOR RESPONSE: $data");
  //     if (data["Code"] == 1) {
  //       Get.snackbar("Success", "Login Successful");
  //     } else {
  //       Get.defaultDialog(
  //         title: "Error",
  //         titleStyle: TextStyle(color: Colors.red),

  //         middleText: data["Message"] ?? "Login Failed",
  //         middleTextStyle: TextStyle(fontSize: 17),
  //         actions: [
  //           ElevatedButton(
  //             style: ButtonStyle(
  //               backgroundColor: WidgetStatePropertyAll(Colors.red),
  //             ),
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: Text("Retry", style: TextStyle(color: Colors.white)),
  //           ),
  //         ],
  //       );
  //     }
  //   } catch (e) {
  //     Get.defaultDialog(title: "Error", middleText: e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

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
