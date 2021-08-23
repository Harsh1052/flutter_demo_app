import 'package:flutter/material.dart';
import 'package:flutter_demo_app/custom_widgets/cart_list_item.dart';

class LastOrderScreen extends StatelessWidget {
  LastOrderScreen({Key? key}) : super(key: key);
  final List<int> qty = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: TabBar(
          indicatorColor: Colors.green,
          tabs: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                "12 Aug",
                style: TextStyle(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                "13 Aug",
                style: TextStyle(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                "14 Aug",
                style: TextStyle(),
              ),
            ),
          ],
        ),
        body: TabBarView(children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return CartItem(
                qty: qty[index],
              );
            },
            itemCount: 6,
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return CartItem(
                qty: qty[index],
              );
            },
            itemCount: 6,
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return CartItem(
                qty: qty[index],
              );
            },
            itemCount: 6,
          ),
        ]),
        bottomNavigationBar: Container(
          color: Colors.lightGreenAccent[700],
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Repeated Order"), Text("\$ 29.78")],
          ),
        ),
      ),
    );
  }
}
