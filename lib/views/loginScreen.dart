import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:n_gauge_apptask/views/exibitorLoginScreen.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 255, 109, 24),
      ),

      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Center(
          child: Column(
            children: [
              Text("Select Your Login Option", style: TextStyle(fontSize: 20)),

              SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => Exibitorloginscreen());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 109, 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "EXIBITOR LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 22, 41, 163),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "VISITOR LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 12),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 55, 157, 59),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "B2B BUYER LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 12),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 208, 59, 235),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "IOT LOGIN",
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
