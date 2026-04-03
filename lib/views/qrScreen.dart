import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class Qrscreen extends StatelessWidget {
  Qrscreen({super.key});
  var orange = Color.fromARGB(255, 255, 109, 24);
  var blue = const Color.fromARGB(255, 22, 41, 163);
  var green = const Color.fromARGB(255, 55, 157, 59);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: TextStyle(color: Colors.white)),
        backgroundColor: orange,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.offNamed('/exhibitorprofile');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "My QR code",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Container(
              alignment: AlignmentGeometry.directional(-1, 1),
              padding: EdgeInsets.all(10),
              child: Text(
                "SCAN AND CONNECT",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),

            SizedBox(height: 100),

            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFFC107), // yellow
                          Color(0xFFFF5722), // orange
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 45,
                      child: Icon(Icons.badge, color: Colors.white, size: 50),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("SCAN BADGE", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(height: 40, thickness: 1),
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 233, 81, 30),
                          Color.fromARGB(255, 255, 34, 97),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 45,
                      child: Icon(Icons.store, color: Colors.white, size: 50),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("SCAN STALL", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
