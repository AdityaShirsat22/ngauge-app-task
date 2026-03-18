import 'package:flutter/material.dart';

class Exibitorloginscreen extends StatelessWidget {
  Exibitorloginscreen({super.key});
  var orange = Color.fromARGB(255, 255, 109, 24);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: TextStyle(color: Colors.white)),
        backgroundColor: orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: Text("Exibitor Login", style: TextStyle(fontSize: 25))
            ),
            TextField(autofocus: true),
            SizedBox(height: 20),
            OutlinedButton(onPressed: () {}, child: Text("Submit")),
            Text("NOTE :-"),
          ],
        ),
      ),
    );
  }
}
