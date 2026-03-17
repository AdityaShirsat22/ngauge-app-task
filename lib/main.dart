import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/views/homeScreen.dart';

void main() {
  runApp(const MyApp());
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
      home: Homescreen(),
    );
  }
}
