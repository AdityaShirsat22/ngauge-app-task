import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/views/Exhibitor/exhibitorListScreen.dart';
import 'package:n_gauge_apptask/views/Exhibitor/exibitor_details_screen.dart';
import '../../Controller/authController.dart';

class Exhibitorprofilescreen extends StatelessWidget {

  final exhibitorDetailsScreen= ExhibitorDetailsScreen();
  Exhibitorprofilescreen({super.key});



  final controller = Get.find<AuthController>();

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text('Back', style: TextStyle(color: Colors.white)),
        backgroundColor: orange,
      ),
      body: Obx(() {
        final data = controller.exhibitor.value;

        // if (data == null) {
        //   return Center(
        //     child: Text(
        //       'No Data',
        //       style: TextStyle(fontSize: 18, color: Colors.grey),
        //     ),
        //   );
        // }

        final exhibitorBadgeNo = data?.exhibitorBadgeNo ?? '';
        final name = data?.stName ?? '';
        final company = data?.stCompany ?? '';
        final Designation = data?.stDesignation ?? '';
        final mobile = data?.stMobileNo ?? '';
        final email = data?.stEmailId ?? '';
        final country = data?.stCompany ?? '';

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  'The email is linked with the following details in our Exhibitor Database',
                ),
                SizedBox(height: 38),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _infoRow("Exhibitor Badge", exhibitorBadgeNo),
                    Divider(),
                    _infoRow('Name', name),
                    Divider(),
                    _infoRow('Organization', company),
                    Divider(),
                    _infoRow('Email', email),
                    Divider(),
                    _infoRow('Mobile', mobile),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
