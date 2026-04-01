import 'package:flutter/material.dart';
import 'package:n_gauge_apptask/views/Exhibitor/exhibitorListScreen.dart';

class Exhibitordashboardscreen extends StatefulWidget {
  const Exhibitordashboardscreen({super.key});

  @override
  State<Exhibitordashboardscreen> createState() =>
      _ExhibitordashboardscreenState();
}

class _ExhibitordashboardscreenState extends State<Exhibitordashboardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: TextStyle(color: Colors.white)),
        backgroundColor: orange,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(20, 15, 20, 0),
        child: Column(
          children: [
            Text(
              "Exhibitor Dashboard",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            // ListView(
            //   children: [

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
