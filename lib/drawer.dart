import 'package:flutter/material.dart';
import 'package:test_scan/history.dart';
import 'package:test_scan/main.dart';
import 'package:test_scan/pages/pdf_tools.dart';
import 'package:test_scan/pages/qr_generate.dart';
import 'package:test_scan/pages/qr_scanner.dart';
import 'package:test_scan/pages/settings.dart';
import 'package:test_scan/pages/trash.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .12,
                width: double.infinity,
                child: const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    "Scan App",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Times New Roman',
                      // fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  "Main",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                    // fontWeight: FontWeight.w100,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const MyApp()),
                      (Route<dynamic> route) => false);
                },
                leading: Image.network(
                  "https://img.icons8.com/?size=100&id=RQA6292xREOo&format=png&color=000000",
                  height: 40,
                  width: 40,
                ),
              ),
              ListTile(
                title: const Text(
                  "Pdf Tools",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                    // fontWeight: FontWeight.w100,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PdfTools()));
                },
                leading: Image.network(
                  "https://img.icons8.com/?size=100&id=EsZwVSGR14qO&format=png&color=000000",
                  height: 40,
                  width: 40,
                ),
              ),
              ListTile(
                title: const Text(
                  "History",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                    // fontWeight: FontWeight.w100,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryPage()));
                },
                leading: Image.network(
                  "https://img.icons8.com/?size=100&id=Gl9uYoRA0dQP&format=png&color=000000",
                  height: 40,
                  width: 40,
                ),
              ),
              ListTile(
                title: const Text(
                  "Trash",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                    // fontWeight: FontWeight.w100,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Trash()));
                },
                leading: Image.network(
                  "https://img.icons8.com/?size=100&id=yzgnvoGvB5Tt&format=png&color=000000",
                  height: 40,
                  width: 40,
                ),
              ),
              ListTile(
                title: const Text(
                  "QR Scanner",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                    // fontWeight: FontWeight.w100,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QrScanner()));
                },
                leading: Image.network(
                  "https://img.icons8.com/?size=100&id=WIcHrb9QDNzV&format=png&color=000000",
                  height: 40,
                  width: 40,
                ),
              ),
              ListTile(
                title: const Text(
                  "QR Generator",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                    // fontWeight: FontWeight.w100,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QrGenerate()));
                },
                leading: Image.network(
                  "https://img.icons8.com/?size=100&id=WIcHrb9QDNzV&format=png&color=000000",
                  height: 40,
                  width: 40,
                ),
              ),
              const Divider(
                thickness: 0.5,
              ),
              ListTile(
                title: const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                    // fontWeight: FontWeight.w100,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
                leading: Image.network(
                  "https://img.icons8.com/?size=100&id=FtTnPlZdnUX5&format=png&color=000000",
                  height: 40,
                  width: 40,
                ),
              ),
              ListTile(
                title: const Text(
                  "Help",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                    // fontWeight: FontWeight.w100,
                  ),
                ),
                onTap: () {
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => Settings()));
                },
                leading: Image.network(
                  "https://img.icons8.com/?size=100&id=AIdpoqeWKNTL&format=png&color=000000",
                  height: MediaQuery.of(context).size.height,
                  width: 40,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://img.icons8.com/?size=100&id=k0oqOPG4RTqB&format=png&color=000000',
                  width: 40,
                  height: 40,
                ),
                Image.network(
                  'https://img.icons8.com/?size=100&id=Nskz7mmYjZXS&format=png&color=000000',
                  width: 40,
                  height: 40,
                ),
                Image.network(
                  'https://img.icons8.com/?size=100&id=HvCPG34SFImj&format=png&color=000000',
                  width: 40,
                  height: 40,
                ),
                Image.network(
                  'https://img.icons8.com/?size=100&id=8XqpKxo881yO&format=png&color=000000',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
