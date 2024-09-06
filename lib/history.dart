import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.grey,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.white,
        title: const Text(
          'History',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontFamily: "Times New Roman"),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: historyPictures.length,
      //   itemBuilder: (context, index) {
      //     final picture = historyPictures[index];
      //     return ListTile(
      //       leading: Image.network(picture.url),
      //       title: Text(picture.description),
      //     );
      //   },
      // ),
    );
  }
}
