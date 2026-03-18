import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/views/dbsmLoginScreen.dart';
import 'package:n_gauge_apptask/views/exibitorLoginScreen.dart';
import 'package:n_gauge_apptask/views/homeScreen.dart';
import 'package:n_gauge_apptask/views/rbsmLoginScreen.dart';
import 'package:n_gauge_apptask/views/visitorLoginScreen.dart';

class B2BBuyerLoginScreen extends StatelessWidget {
  const B2BBuyerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 255, 109, 24),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(Homescreen());
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),

      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Center(
          child: Column(
            children: [
              Text("Select Option", style: TextStyle(fontSize: 20)),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => Rbsmloginscreen());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 109, 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "RBSM LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(Dbsmloginscreen());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 22, 41, 163),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "DBSM LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
