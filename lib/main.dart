import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:test_scan/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _pictures = [];
  List<String> historyPictures = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Perform any additional initialization or permissions requests here
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
            elevation: 0,
            shadowColor: Colors.grey,
            iconTheme: const IconThemeData(color: Colors.black, size: 30),
            backgroundColor: Colors.white,
            title: const Text(
              'Scan App',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Times New Roman',
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (_pictures.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("No pictures added yet."),
                    ),
                  for (var picture in _pictures)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(File(picture)),
                    ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: _scanDocuments,
            child: Image.network(
              "https://img.icons8.com/?size=100&id=gdcOScfhaRmr&format=png&color=000000",
              height: 40,
              width: 40,
            ),
          ),
          bottomNavigationBar: _pictures.isNotEmpty
              ? BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      label: 'Save PDF',
                      icon: IconButton(
                        onPressed: () {},
                        icon: Image.network(
                          "https://img.icons8.com/?size=100&id=6AFatvhb4ta5&format=png&color=000000",
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Share',
                      icon: IconButton(
                        onPressed: () {
                          _sharePictures();
                        },
                        icon: Image.network(
                          "https://img.icons8.com/?size=100&id=81WdYxfDEXPK&format=png&color=000000",
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Save as history',
                      icon: IconButton(
                        onPressed: () {
                          _saveAsHistory();
                        },
                        icon: Image.network(
                          "https://img.icons8.com/?size=100&id=Gl9uYoRA0dQP&format=png&color=000000",
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ],
                  selectedFontSize: 16,
                  unselectedFontSize: 16,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black,
                  iconSize: 36,
                )
              : null),
    );
  }

  // Initiates the document scanning process
  void _scanDocuments() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
      });
    } catch (exception) {
      // Show a dialog or snackbar with the error message
      _showErrorDialog(exception.toString());
    }
  }

  // Saves the pictures as a PDF document
  void _sharePictures() async {
    final pdf = pw.Document();

    try {
      // Add each image as a page in the PDF document
      for (String imagePath in _pictures) {
        final image = File(imagePath);
        final imageBytes = await image.readAsBytes();
        final pdfImage = pw.MemoryImage(imageBytes);

        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Image(pdfImage),
              ); // Center
            },
          ),
        );
      }

      // Get the application documents directory
      final outputDirectory = await getApplicationDocumentsDirectory();
      final pdfFilePath = '${outputDirectory.path}/scanned_images.pdf';

      // Save the PDF document to the specified path
      final pdfFile = File(pdfFilePath);
      await pdfFile.writeAsBytes(await pdf.save());

      // Optionally, you can print the document or share it
      await Printing.sharePdf(
          bytes: await pdf.save(), filename: 'scanned_images.pdf');
      // ignore: empty_catches
    } catch (e) {}
  }

  // Displays a snackbar with the given message

  // Shows an error dialog with the given message
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _saveAsHistory() {
    try {
      setState(() {
        print("sdaasdas");
        historyPictures = _pictures;
      });
    } catch (exception) {
      _showErrorDialog(exception.toString());
    }
  }
}
