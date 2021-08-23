import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/custom_widgets/address_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Container(
              height: screenHeight * 0.3,
              color: Colors.black87,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.green,
                        size: 34,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Harsh Sureja",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Push Notification",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    CupertinoSwitch(value: true, onChanged: (value) {})
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: TabBar(
                tabs: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                    child: Text("My Address"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                    child: Text("My Card"),
                  ),
                ],
                indicatorColor: Colors.green,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return AddressCard(
                        name: "Address ${index + 1}",
                        address: "Address ",
                      );
                    },
                    itemCount: 5,
                  ),
                  Center(
                    child: Text("2"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
