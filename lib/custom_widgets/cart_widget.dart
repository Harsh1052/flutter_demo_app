import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  final String? numberOfOrder;
  CartIcon({this.numberOfOrder});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Badge(
        badgeColor: Colors.green,
        child: Icon(Icons.shopping_cart_outlined),
        badgeContent: Text(numberOfOrder!),
      ),
    );
  }
}
