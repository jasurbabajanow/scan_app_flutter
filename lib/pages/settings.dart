import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.grey,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontFamily: "Times New Roman"),
        ),
      ),
    );
  }
}
