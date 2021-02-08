import 'package:flutter/material.dart';

import 'main_screen.dart';
import 'qr_scan.dart';
import 'const.dart';

class UsernameLogin extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kFirstColor,
        title: Text(
          'Username Login',
          style: kMainText,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              height: 200,
              child: FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  backgroundColor: kFirstColor,
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'ระบุรหัสพนักงาน'),
                    controller: textController,
                    style: kDetailText,
                    onChanged: (text) {},
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.qr_code,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QRScan()));
                    })
              ],
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
          ],
        ),
      ),
    );
  }
}
