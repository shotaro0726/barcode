import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';

class Barcode extends StatefulWidget {
  Barcode({this.barcodeString, this.codeType});

  final String barcodeString;
  final BarCodeType codeType;

  @override
  State<StatefulWidget> createState() => BarcodeState();
}

class BarcodeState extends State<Barcode> {
  @override
  Widget build(BuildContext context) {
    return _generate();
  }

  Widget _generate() {
    if (widget.barcodeString == null || widget.barcodeString.isEmpty) {
      return _createEmptyWidget();
    } else {
      return _createBarcode();
    }
  }

  Widget _createEmptyWidget() {
    return Container();
  }

  BarCodeImage _createBarcode() {
    return BarCodeImage(
      data: widget.barcodeString,
      codeType: widget.codeType,
      lineWidth: 2.0,
      barHeight: 100.0,
      hasText: true,
      onError: (error) {
        print("error -> $error");
      },
    );
  }
}