import 'package:get/get.dart';
import 'package:n_gauge_apptask/services/hiveservice.dart';

class SplashController extends GetxController {
  final Hiveservice _hive = Get.find<Hiveservice>();

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 2));

    if (_hive.isloggedIn()) {
      String? role = _hive.getRole();

      if (role == "visitor") {
        Get.offAllNamed('/visitorHome');
      } else {
        Get.offAllNamed('/exhibitorHome');
      }
    } else {
      Get.offAllNamed('/login');
    }
  }
}
