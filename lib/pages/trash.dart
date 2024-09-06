import 'package:flutter/material.dart';

class Trash extends StatelessWidget {
  const Trash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.grey,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.white,
        title: const Text(
          'Trash',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontFamily: "Times New Roman"),
        ),
      ),
    );
  }
}
