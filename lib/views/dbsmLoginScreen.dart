import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/model_view/authController.dart';
import 'package:n_gauge_apptask/views/homeScreen.dart';

class Dbsmloginscreen extends StatefulWidget {
  Dbsmloginscreen({super.key});

  @override
  State<Dbsmloginscreen> createState() => _VisitorloginscreenState();
}

class _VisitorloginscreenState extends State<Dbsmloginscreen> {
  var orange = Color.fromARGB(255, 255, 109, 24);

  var blue = const Color.fromARGB(255, 22, 41, 163);

  var green = const Color.fromARGB(255, 55, 157, 59);

  AuthController controller = AuthController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: TextStyle(color: Colors.white)),
        backgroundColor: orange,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(Homescreen());
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 30),
            Center(
              child: Text(
                "Enter your DBSM credentails",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: username,
              cursorColor: Colors.blue,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hint: Text("Enter your Delegate Id "),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              obscureText: isHidden,
              cursorColor: Colors.blue,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hint: Text("Enter Your Password "),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forget password?",
                style: TextStyle(color: Colors.lightBlue[600]),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  String id = username.text.trim();
                  String pass = password.text.trim();

                  if (id.isEmpty || pass.isEmpty) {
                    Get.snackbar("Error", "enter all fields");
                    return;
                  }
                  controller.dbsmLogin(id, pass);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
