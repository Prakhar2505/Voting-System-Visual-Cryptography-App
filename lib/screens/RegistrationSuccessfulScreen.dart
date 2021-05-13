import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegistrationSuccessfulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: QrImage(
            data: "1234567890",
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
