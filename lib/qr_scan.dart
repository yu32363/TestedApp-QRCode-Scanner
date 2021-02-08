import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'username_login.dart';
import 'main_screen.dart';
import 'const.dart';

class QRScan extends StatefulWidget {
  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.front,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThirdColor,
      appBar: AppBar(
        backgroundColor: kFirstColor,
        title: Text(
          'QR Login',
          style: kMainText,
        ),
      ),
      body: Column(
        children: [
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    // ignore: unrelated_type_equality_checks
                    icon: FutureBuilder(
                      future: controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        return Icon(
                          snapshot.data == true
                              ? Icons.flash_on
                              : Icons.flash_off,
                          color: snapshot.data == true
                              ? Colors.amber
                              : Colors.black,
                          size: 40,
                        );
                      },
                    )),
                if (result != null)
                  Text(
                    'รหัสพนักงาน: ${result.code}',
                    style: kMenuText,
                  )
                else
                  Text(
                    'สแกน QR ของท่าน',
                    style: kMenuText,
                  ),
                RaisedButton(
                  color: kFirstColor,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  child: Text(
                    'ยืนยัน',
                    style: kMainText,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UsernameLogin()));
                  },
                  child: Text(
                    'กดที่นี่หากสแกนไม่ติด',
                    style: TextStyle(fontFamily: 'Mitr', color: Colors.red),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
