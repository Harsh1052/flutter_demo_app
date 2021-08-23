import 'package:flutter/material.dart';
import 'package:flutter_demo_app/custom_widgets/cart_list_item.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CartItem(
            qty: qty[index],
            onAdd: () {
              qty[index]++;
              setState(() {});
            },
            onRemove: () {
              qty[index]--;
              setState(() {});
            },
          );
        },
        itemCount: qty.length,
      ),
      bottomNavigationBar: Container(
        color: Colors.lightGreenAccent[700],
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("BUY"), Text("\$ 29.78")],
        ),
      ),
    );
  }
}
