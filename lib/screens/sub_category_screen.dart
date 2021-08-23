import 'package:flutter/material.dart';
import 'package:flutter_demo_app/custom_widgets/cart_widget.dart';
import 'package:flutter_demo_app/custom_widgets/home_screen_list_widget.dart';
import 'package:flutter_demo_app/models/menu_item_model.dart';

import 'food_details_screen.dart';

class SubProductScreen extends StatelessWidget {
  final String? foodName;

  SubProductScreen({this.foodName});
  final List<MenuItem> items = [
    MenuItem(
        name: "Ribeye steak",
        count: "\$ 25.00",
        imagePath: "assets/burger.jpeg",
        descriptions: "Beef steak, sauce,french fries"),
    MenuItem(
        name: "Wood grill",
        count: "\$ 25.00",
        imagePath: "assets/drink.jpeg",
        descriptions: "park, tomato,onion"),
    MenuItem(
        name: "Sandwich",
        count: "\$ 25.00",
        imagePath: "assets/fruits.jpeg",
        descriptions: "Beef steak, sauce, french fries"),
    MenuItem(
        name: "Burger",
        count: "\$ 25.00",
        imagePath: "assets/salad.jpeg",
        descriptions: "park, tomato,onion"),
    MenuItem(
        name: "Entrees",
        count: "\$ 25.00",
        imagePath: "assets/burger.jpeg",
        descriptions: "Beef steak, sauce,french fries"),
    MenuItem(
        name: "Drinks",
        count: "\$ 25.00",
        imagePath: "assets/drink.jpeg",
        descriptions: "park, tomato,onion"),
    MenuItem(
        name: "Fruits",
        count: "\$ 25.00",
        imagePath: "assets/fruits.jpeg",
        descriptions: "Beef steak, sauce,french fries"),
    MenuItem(
        name: "Salads",
        count: "\$ 25.00",
        imagePath: "assets/salad.jpeg",
        descriptions: "park, tomato,onion"),
    MenuItem(
        name: "Entrees",
        count: "\$ 25.00",
        imagePath: "assets/burger.jpeg",
        descriptions: "Beef steak, sauce,french fries"),
    MenuItem(
        name: "Drinks",
        count: "\$ 25.00",
        imagePath: "assets/drink.jpeg",
        descriptions: "park, tomato,onion"),
    MenuItem(
        name: "Fruits",
        count: "\$ 25.00",
        imagePath: "assets/fruits.jpeg",
        descriptions: "Beef steak, sauce,french fries"),
    MenuItem(
        name: "Salads",
        count: "\$ 25.00",
        imagePath: "assets/salad.jpeg",
        descriptions: "park, tomato,onion"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [CartIcon(numberOfOrder: "2")],
        title: Text(
          foodName ?? "",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return SizedBox(
            height: 200,
            child: HomeScreenListItem(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodDetailsScreen(
                              foodName: item.name,
                              price: item.count,
                              imagePath: item.imagePath,
                              descriptions: item.descriptions,
                            )));
              },
              name: item.name,
              count: item.count,
              imagePath: item.imagePath,
              descriptions: item.descriptions,
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
