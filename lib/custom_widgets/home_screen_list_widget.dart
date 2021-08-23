import 'package:flutter/material.dart';

class HomeScreenListItem extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? count;
  final String? descriptions;
  final VoidCallback? onTap;
  HomeScreenListItem(
      {this.count, this.imagePath, this.name, this.descriptions, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePath ?? "assets/logo.png"))),
        child: Container(
          color: Colors.black54,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name ?? "not available",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  descriptions == null ? Container() : Text(descriptions!)
                ],
              ),
              Text(
                count ?? "N/A",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
