import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/model_view/filterController.dart';
import 'package:n_gauge_apptask/views/exhibitorListScreen.dart';

class Filterscreenexibitorlist extends StatelessWidget {
  final FilterController controller = Get.put(FilterController());

  Filterscreenexibitorlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),

          /// drag handle
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Filter",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),

          Expanded(
            child: Row(
              children: [
                /// LEFT MENU
                Container(
                  width: 150,
                  color: Colors.grey.shade200,
                  child: Column(
                    children: [
                      menuTile("Hall", 0),
                      menuTile("Country", 1),
                      menuTile("Product Categories", 2),
                    ],
                  ),
                ),

                /// RIGHT PANEL
                Expanded(
                  child: Obx(() {
                    switch (controller.selectedMenu.value) {
                      case 0:
                        return hallUI();
                      case 1:
                        return countryUI();
                      default:
                        return categoryUI();
                    }
                  }),
                ),
              ],
            ),
          ),

          /// bottom buttons
          bottomButton(),
        ],
      ),
    );
  }

  /// LEFT MENU TILE
  Widget menuTile(String title, int index) {
    return Obx(
      () => InkWell(
        onTap: () => controller.changeMenu(index),
        child: Container(
          color: controller.selectedMenu.value == index
              ? Colors.grey.shade300
              : Colors.grey.shade200,
          child: ListTile(title: Text(title)),
        ),
      ),
    );
  }

  /// HALL UI
  Widget hallUI() {
    return ListView(
      children: [
        CheckboxListTile(
          value: false,
          onChanged: (v) {},
          title: Text("HALL 1"),
        ),
      ],
    );
  }

  /// COUNTRY UI
  Widget countryUI() {
    return ListView(
      children: [
        CheckboxListTile(value: false, onChanged: (v) {}, title: Text("INDIA")),
      ],
    );
  }

  /// CATEGORY UI
  Widget categoryUI() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search Categories",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),

        Expanded(
          child: ListView(
            children: [
              CheckboxListTile(
                value: false,
                onChanged: (v) {},
                title: Text("HT Power Cables"),
              ),
              CheckboxListTile(
                value: false,
                onChanged: (v) {},
                title: Text("EHV Cables"),
              ),
              CheckboxListTile(
                value: false,
                onChanged: (v) {},
                title: Text("Instrumentation Cables"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget bottomButton() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 50,
          color: orange,
          child: Center(
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Apply",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: 50,
          color: Colors.grey.shade300,
          child: Center(child: Text("Clear", style: TextStyle(fontSize: 16))),
        ),
      ),
    ],
  );
}
