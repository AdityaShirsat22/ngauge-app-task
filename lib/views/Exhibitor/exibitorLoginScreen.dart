import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/Controller/authController.dart';
import 'package:n_gauge_apptask/views/homeScreen.dart';

// ignore: must_be_immutable
class Exibitorloginscreen extends StatelessWidget {
  Exibitorloginscreen({super.key});

  final controller = Get.find<AuthController>();

  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  var orange = Color.fromARGB(255, 255, 109, 24);
  var blue = const Color.fromARGB(255, 22, 41, 163);
  var green = const Color.fromARGB(255, 55, 157, 59);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: TextStyle(color: Colors.white)),
        backgroundColor: orange,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => Homescreen());
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Exihibitor Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formkey,
                child: TextFormField(
                  controller: emailController,
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hint: Text("Enter Email Id"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "* required";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () async {
                    if (_formkey.currentState?.validate() ?? false) {
                      String email = emailController.text.trim();

                      if (email.isEmpty) return;

                      bool success = await controller.getExhibitorDetails(
                        email,
                      );

                      if (success) {
                        Get.toNamed('/exhibitorDetails');
                      } else {
                        Get.snackbar("Error", "Email not found");
                      }
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "NOTE :-",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "- Please use the email ID that was submitted by your organization for your Exihibitor Badge registration",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 2),
              Text(
                "- You will recieve your One Time Login Code on your registered email.",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 2),
              Text(
                "- If your email is not registered then please contact you team responsible for submitting the data for 'Exhibitor Badges'",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
