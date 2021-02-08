import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: kFirstColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'N0001',
                    style: kMainText,
                  ),
                  Text(
                    'สวัสดิเกียรติ แสงบุญ',
                    style: kMainText,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: kFirstColor,
                size: 40,
              ),
              title: Text(
                'ออกจากระบบ',
                style: kMenuText,
              ),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: kFirstColor,
        title: Text(
          'รายการตรวจ',
          style: kMainText,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: kSecondColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ผู้ตรวจ: สวัสดิเกียรติ แสงบุญ',
                  style: kDetailText,
                ),
                Text(
                  'วันที่ตรวจ: 21/01/21',
                  style: kDetailText,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: 250,
                      height: 60,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: kFirstColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'ตรวจประจำวัน',
                            style: kMainText,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: 250,
                      height: 60,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: kFirstColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_circle,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'ตรวจสารเสพติด',
                            style: kMainText,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: 250,
                      height: 60,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: kFirstColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.assignment,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'แสดงผลการตรวจ',
                            style: kMainText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
