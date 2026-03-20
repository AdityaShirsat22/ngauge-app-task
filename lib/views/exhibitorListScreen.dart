import 'package:flutter/material.dart';

class Exhibitorlistscreen extends StatefulWidget {
  const Exhibitorlistscreen({super.key});
  @override
  State<Exhibitorlistscreen> createState() => _ExhibtorlistscreenState();
}

var orange = Color.fromARGB(255, 255, 109, 24);
var blue = const Color.fromARGB(255, 22, 41, 163);
var green = const Color.fromARGB(255, 55, 157, 59);

class _ExhibtorlistscreenState extends State<Exhibitorlistscreen> {
  final List<Map<String, String>> exhibitors = [
    {"name": "N-GAUGE SOL PVT LTD", "stall": "(Hall 1  STALL : H1A8)"},
    {"name": "N-GAUGE SOLUTIONS PVT LTD", "stall": "(Hall 1  STALL : H1A10)"},
    {"name": "NGAUGE NILAY PVT LTFF", "stall": "(Hall 1  STALL : H1E3)"},
    {"name": "NGAUGE SOLUTION", "stall": "(Hall 1  STALL : H1B10)"},
    {"name": "NGAUGE SOLUTION GSS", "stall": "(Hall 1  STALL : H1B7)"},
    {"name": "NGAUGE SOLUTION PVT LTD", "stall": "(Hall 1  STALL : H1A11)"},
    {"name": "NGAUGE TUSHAR", "stall": "(Hall 1  STALL : H1B11)"},
    {"name": "TEST", "stall": "(Hall 1  STALL : H1AE6)"},
    {"name": "TEST10", "stall": "(Hall 1  STALL : H1A12)"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: TextStyle(color: Colors.white)),
        backgroundColor: orange,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "EXHIBITOR LIST    ${exhibitors.length.toString()}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_alt,
                        size: 30,
                        color: Colors.lightBlue[800],
                      ),
                    ),
                    Text("Filter"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              cursorColor: Colors.blue,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Search By Company / Product Name ",
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: exhibitors.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          exhibitors[index]["name"]!,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(exhibitors[index]["stall"]!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.star,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        onTap: () {},
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
