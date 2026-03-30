import 'package:get/get.dart';

class FilterController extends GetxController {
  RxInt selectedMenu = 0.obs;

  void changeMenu(int index) {
    selectedMenu.value = index;
  }
}
