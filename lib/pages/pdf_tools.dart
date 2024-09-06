import 'package:flutter/material.dart';

class PdfTools extends StatelessWidget {
  const PdfTools({super.key});

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
          'PDF Tools',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Times New Roman',
          ),
        ),
      ),
    );
  }
}
