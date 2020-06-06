import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../components/buttons.dart';

class QRCodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  final _codeStringControler = TextEditingController();
  String _codeText = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _qrcode(),
            _inputArea(),
            _createButton(),
          ],
        ),
      ),
    );
  }

  Widget _qrcode() {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: _codeText.isEmpty
          ? Icon(Icons.select_all, size: 100.0)
          : QrImage(
              data: _codeText,
              version: QrVersions.auto,
              size: 150.0,
            ),
    );
  }

  Widget _inputArea() {
    return Container(
      width: 280.0,
      alignment: Alignment.center,
      child: TextField(
        maxLines: 4,
        controller: _codeStringControler,
        decoration: const InputDecoration(
          labelText: "Input the QR Code text",
        ),
      ),
    );
  }

  Widget _createButton() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        child: Text("Create"),
        onPressed: () {
          setState(() {
            _codeText = _codeStringControler.text;
          });
        },
      ),
    );
  }
}