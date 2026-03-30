import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/services/auth_service.dart';
import 'package:n_gauge_apptask/views/homeScreenWithoutLogin.dart';
import 'package:n_gauge_apptask/views/all_loginScreen.dart';

void main() {
  runApp(const MyApp());
  Get.put(AuthService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => Homescreen()),
        GetPage(name: '/login', page: () => Loginscreen()),
      ],
    );
  }
}
