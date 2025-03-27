import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  QRScannerScreenState createState() => QRScannerScreenState();
}

class QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: const Text('QR Scanner', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber[800],
      ),
      body: const SizedBox(),

      // Column(
      //   children: [
      //     Expanded(
      //       flex: 5,
      //       child: QRView(
      //         key: qrKey,
      //         onQRViewCreated: _onQRViewCreated,
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: Center(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             // Handle QR code result
      //           },
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: Colors.amber[800],
      //             padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //           ),
      //           child: const Text('Scan QR Code', style: TextStyle(color: Colors.white)),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     // Handle scanned data
  //   });
  // }

  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }
}
