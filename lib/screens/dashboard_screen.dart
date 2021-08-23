import 'package:flutter/material.dart';
import 'package:flutter_demo_app/custom_widgets/home_screen_list_widget.dart';
import 'package:flutter_demo_app/models/menu_item_model.dart';
import 'package:flutter_demo_app/screens/sub_category_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashBoardScreen extends StatelessWidget {
  final List<MenuItem> items = [
    MenuItem(name: "Entrees", count: "23", imagePath: "assets/burger.jpeg"),
    MenuItem(name: "Drinks", count: "23", imagePath: "assets/drink.jpeg"),
    MenuItem(name: "Fruits", count: "23", imagePath: "assets/fruits.jpeg"),
    MenuItem(name: "Salads", count: "23", imagePath: "assets/salad.jpeg"),
    MenuItem(name: "Entrees", count: "23", imagePath: "assets/burger.jpeg"),
    MenuItem(name: "Drinks", count: "23", imagePath: "assets/drink.jpeg"),
    MenuItem(name: "Fruits", count: "23", imagePath: "assets/fruits.jpeg"),
    MenuItem(name: "Salads", count: "23", imagePath: "assets/salad.jpeg"),
    MenuItem(name: "Entrees", count: "23", imagePath: "assets/burger.jpeg"),
    MenuItem(name: "Drinks", count: "23", imagePath: "assets/drink.jpeg"),
    MenuItem(name: "Fruits", count: "23", imagePath: "assets/fruits.jpeg"),
    MenuItem(name: "Salads", count: "23", imagePath: "assets/salad.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return HomeScreenListItem(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubProductScreen(
                          foodName: item.name,
                        )));
          },
          name: item.name,
          count: item.count,
          imagePath: item.imagePath,
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(2, index.isEven ? 2 : 1);
      },
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
