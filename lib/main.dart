import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:n_gauge_apptask/Controller/authController.dart';
import 'package:n_gauge_apptask/services/hiveservice.dart';
import 'package:n_gauge_apptask/services/auth_service.dart';
import 'package:n_gauge_apptask/views/Exhibitor/exhibitorDashboardScreen.dart';
import 'package:n_gauge_apptask/views/Exhibitor/exhibitorProfileScreen.dart';
import 'package:n_gauge_apptask/views/Exhibitor/exhibitorSettingScreen.dart';
import 'package:n_gauge_apptask/views/Exhibitor/exibitor_details_screen.dart';
import 'package:n_gauge_apptask/views/Visitor/visitorDashboardScreen.dart';
import 'package:n_gauge_apptask/views/Visitor/visitorProfileScreen.dart';
import 'package:n_gauge_apptask/views/Visitor/visitorSettingScreen.dart';
import 'package:n_gauge_apptask/views/homeScreen.dart';
import 'package:n_gauge_apptask/views/all_loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  Get.put(Hiveservice(), permanent: true);

  Get.put(AuthService(), permanent: true);
  Get.put(AuthController(), permanent: true);

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
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => Homescreen()),
        GetPage(name: '/login', page: () => Loginscreen()),
        GetPage(name: '/exhibitorHome', page: () => Exhibitordashboardscreen()),
        GetPage(name: '/visitorHome', page: () => Visitordashboardscreen()),
        GetPage(name: '/visitorProfile', page: () => VisitorProfileScreen()),
        GetPage(
          name: '/exhibitorDetails',
          page: () => ExhibitorDetailsScreen(),
        ),
        GetPage(
          name: '/exhibitorsetting',
          page: () => ExhibitorsettingScreen(),
        ),
        GetPage(name: '/visitorsetting', page: () => Visitorsettingscreen()),
        GetPage(
          name: '/exhibitorprofile',
          page: () => Exhibitorprofilescreen(),
        ),
      ],
    );
  }
}
