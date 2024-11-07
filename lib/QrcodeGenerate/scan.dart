import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:fitnessadmin/model/foodItem.dart';
import 'package:fitnessadmin/QrcodeGenerate/scannedQRCodesScreen.dart'; // Ensure correct import

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String qrResult = "Scan a QR code";

  // Function to show the scanned food details on the next page
  void _showFoodDetails(String qrData) {
    if (qrData.isNotEmpty) {
      // Assuming QR data is a JSON string
      Map<String, dynamic>? foodData = _parseQRData(qrData);
      if (foodData != null) {
        Food food = Food.fromMap(foodData);
        print("Food data parsed successfully: ${food.name}");
        _navigateToFoodDetailsPage(food);
      } else {
        print("Error: QR Data parsing failed.");
      }
    }
  }

  Map<String, dynamic>? _parseQRData(String qrData) {
    try {
      String validJsonString = qrData
          .replaceAll(RegExp(r'(\w+):'), r'"\1":')
          .replaceAll(RegExp(r'(\w+)\s*,'), r'"\1",');
      print("Preprocessed QR Data: $validJsonString");
      return Map<String, dynamic>.from(json.decode(validJsonString));
    } catch (e) {
      print("Error parsing QR data: $e");
      return null;
    }
  }

  void _navigateToFoodDetailsPage(Food food) {
    print("Navigating to the next page with food: ${food.name}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scannedqrcodesscreen(food: food),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Code Scanner")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(qrResult),
          Expanded(
            child: MobileScanner(
              onDetect: (BarcodeCapture barcodeCapture) {
                final String qrCode = barcodeCapture.barcodes.isNotEmpty
                    ? barcodeCapture.barcodes[0].rawValue ?? 'No QR code found!'
                    : 'No QR code found!';

                setState(() {
                  qrResult = qrCode;
                });

                // Show food details based on the QR data
                _showFoodDetails(qrCode);
              },
            ),
          ),
        ],
      ),
    );
  }
}
