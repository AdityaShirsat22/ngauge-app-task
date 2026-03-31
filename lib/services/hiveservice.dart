import 'package:hive_flutter/adapters.dart';

class Hiveservice {
  final Box _box = Hive.box('authBox');

  void saveRole(String role) {
    _box.put('role', role);
  }

  String? getRole() {
    return _box.get('role');
  }

  void setLoggedIn(bool value) {
    _box.put('isLoggedIn', value);
  }

  bool isloggedIn() {
    return _box.get('isLoggedIn', defaultValue: false);
  }

  void loggout() {
    _box.clear();
  }
}
