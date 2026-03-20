import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:n_gauge_apptask/views/exhibitorListScreen.dart';
import 'package:n_gauge_apptask/views/loginScreen.dart';
import 'package:n_gauge_apptask/views/qrScreen.dart';

// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var orange = Color.fromARGB(255, 255, 109, 24);

  var blue = const Color.fromARGB(255, 22, 41, 163);

  var green = const Color.fromARGB(255, 55, 157, 59);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orange,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => Qrscreen());
            },
            icon: Icon(Icons.qr_code, color: Colors.white, size: 28),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Loginscreen());
            },
            icon: Icon(Icons.person, color: Colors.white, size: 28),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Loginscreen());
            },
            icon: Icon(Icons.star, color: Colors.white, size: 28),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Loginscreen());
            },
            icon: Icon(Icons.settings, color: Colors.white, size: 28),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Loginscreen());
            },
            icon: Icon(Icons.notifications, color: Colors.white, size: 28),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                viewportFraction: 1,
              ),
              items: [
                Image(image: AssetImage("assets/image1.jpeg")),
                Image(image: AssetImage("assets/image2.jpeg")),
              ],
            ),
            ExpansionTile(
              title: Text(
                "PLAN YOUR VISIT",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color.fromARGB(255, 255, 109, 24),
              collapsedBackgroundColor: const Color.fromARGB(255, 255, 109, 24),
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.dashboard,
                          color: Colors.orange,
                          size: 30,
                        ),
                        title: Text("My Dashboard"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        onTap: () {
                          Get.to(() => Loginscreen());
                        },
                      ),
                      Divider(color: orange, thickness: 0.1),
                      ListTile(
                        minTileHeight: 20,
                        leading: Icon(
                          Icons.people,
                          color: Colors.orange,
                          size: 30,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        title: Text("Exhibitors"),
                        onTap: () {
                          Get.to(Exhibitorlistscreen());
                        },
                      ),
                      Divider(color: orange, thickness: 0.1),
                      ListTile(
                        leading: Icon(
                          Icons.home_filled,
                          color: Colors.orange,
                          size: 30,
                        ),
                        title: Text("Pavilions"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                      Divider(color: orange, thickness: 0.1),
                      ListTile(
                        leading: Icon(
                          Icons.event_available,
                          color: Colors.orange,
                          size: 30,
                        ),
                        title: Text("Concurrent Events"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                      Divider(color: orange, thickness: 0.1),
                      ListTile(
                        leading: Icon(
                          Icons.people,
                          color: Colors.orange,
                          size: 30,
                        ),
                        title: Text("Townhall Agenda"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                      Divider(color: orange, thickness: 0.1),
                      ListTile(
                        leading: Icon(
                          Icons.map,
                          color: Colors.orange,
                          size: 30,
                        ),
                        title: Text("Plan Your Travel"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                      Divider(color: orange, thickness: 0.1),
                      ListTile(
                        leading: Icon(
                          Icons.event,
                          color: Colors.orange,
                          size: 30,
                        ),
                        title: Text("Important Dates And Events"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                      Divider(color: orange, thickness: 0.1),
                      ListTile(
                        leading: Icon(
                          Icons.app_registration,
                          color: Colors.orange,
                          size: 30,
                        ),
                        title: Text("Register"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                      Divider(color: orange, thickness: 0.1),
                      ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.orange,
                          size: 30,
                        ),
                        title: Text("Invite Friends"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "AT THE VENEU",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color.fromARGB(255, 22, 41, 163),
              collapsedBackgroundColor: const Color.fromARGB(255, 22, 41, 163),
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.location_on, color: blue, size: 30),
                        title: Text("Venue and Layout"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        onTap: () {},
                      ),
                      Divider(color: blue, thickness: 0.1),
                      ListTile(
                        leading: Icon(Icons.analytics, color: blue, size: 30),
                        title: Text("Facilities on Ground"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        onTap: () {},
                      ),
                      Divider(color: blue, thickness: 0.1),
                      ListTile(
                        leading: Icon(
                          Icons.support_agent,
                          color: blue,
                          size: 30,
                        ),
                        title: Text("Support"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        onTap: () {},
                      ),
                      Divider(color: blue, thickness: 0.1),
                      ListTile(
                        leading: Icon(
                          Icons.feedback_sharp,
                          color: blue,
                          size: 30,
                        ),
                        title: Text("Feedback"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("ABOUT EVENT", style: TextStyle(color: Colors.white)),
              backgroundColor: green,
              collapsedBackgroundColor: green,
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.calendar_month,
                          color: green,
                          size: 30,
                        ),
                        title: Text("About Event"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        onTap: () {},
                      ),
                      Divider(color: green, thickness: 0.3),
                      ListTile(
                        leading: Icon(
                          Icons.meeting_room,
                          color: green,
                          size: 30,
                        ),
                        title: Text("Organizers"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        onTap: () {},
                      ),
                      Divider(color: green, thickness: 0.3),
                      ListTile(
                        leading: Icon(
                          Icons.attach_money,
                          color: green,
                          size: 30,
                        ),
                        title: Text("Sponser"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
