import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerate extends StatelessWidget {
  const QrGenerate({super.key});

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
          'QR Generator',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontFamily: "Times New Roman"),
        ),
      ),
      body: QRGeneratorPage(),
    );
  }
}

class QRGeneratorPage extends StatefulWidget {
  @override
  _QRGeneratorPageState createState() => _QRGeneratorPageState();
}

class _QRGeneratorPageState extends State<QRGeneratorPage> {
  final TextEditingController _textController = TextEditingController();
  String _qrData = 'Hello, QR Code!';
  String _filePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // QrImage(
            // data: _qrData,
            // version: QrVersions.auto,
            // size: 200.0,
            // ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input information for QR Code',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _qrData = _textController.text;
                });

                await _saveQrCode();
              },
              child: const Text('QR Code Generate and Save'),
            ),
            const SizedBox(height: 20.0),
            if (_filePath.isNotEmpty) Text('QR Code saved at: $_filePath'),
          ],
        ),
      ),
    );
  }

  Future<void> _saveQrCode() async {
    try {
      // Enjamda ýazmaga rugsat almak
      if (await Permission.storage.request().isGranted) {
        // QR kod suratyny PNG formatynda ýasamak
        final qrValidationResult = QrValidator.validate(
          data: _qrData,
          version: QrVersions.auto,
          errorCorrectionLevel: QrErrorCorrectLevel.L,
        );

        if (qrValidationResult.status == QrValidationStatus.valid) {
          final qrCode = qrValidationResult.qrCode;
          final painter = QrPainter.withQr(
            qr: qrCode!,
            color: const Color(0xFF000000),
            emptyColor: const Color(0xFFFFFFFF),
            gapless: true,
            embeddedImageStyle: null,
            embeddedImage: null,
          );

          // PNG suratyny byte array hökmünde almak
          final picData =
              await painter.toImageData(2048, format: ImageByteFormat.png);
          final buffer = picData!.buffer.asUint8List();

          // QR kod suratyny ýazmak üçin enjamda ýeriň salgysyny almak
          final directory = await getExternalStorageDirectory();
          final path = directory?.path;

          if (path != null) {
            final file = File('$path/qr_code.png');
            await file.writeAsBytes(buffer);
            setState(() {
              _filePath = file.path;
            });
          }
        }
      } else {
        print('Storage rugsady berilmedi');
      }
    } catch (e) {
      print('QR kod ýazmakda säwlik boldy: $e');
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    // Check if the permission is already granted
    if (await permission.isGranted) {
      return true;
    }

    // Request the permission
    final result = await permission.request();
    return result == PermissionStatus.granted;
  }
}
