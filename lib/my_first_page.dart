import 'package:flutter/material.dart';

import 'qr_scan.dart';
import 'const.dart';

class MyFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kFirstColor,
        title: Text(
          'Niramit Health Check',
          style: kMainText,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  'NRM 2003',
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 40,
                    fontFamily: 'Mitr',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: kFirstColor,
                  thickness: 1.0,
                  indent: 100,
                  endIndent: 100,
                ),
                Text(
                  'Health Check System',
                  style: TextStyle(
                    color: kFirstColor,
                    fontSize: 20,
                    fontFamily: 'Mitr',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            height: 300,
            child: Image.asset('images/FirstScreen.png'),
          ),
          RaisedButton(
            color: kFirstColor,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QRScan()));
            },
            child: Text(
              'เริ่มใช้งาน',
              style: kMainText,
            ),
          ),
        ],
      ),
    );
  }
}
