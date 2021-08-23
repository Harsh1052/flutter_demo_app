import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  CartItem({this.onAdd, this.onRemove, this.qty, this.isEdit = false});
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final int? qty;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    print("Edit Value in Cart CustomWidget:-${isEdit}");
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Padding(
        padding: EdgeInsets.only(top: 4.0, left: 4.0, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Image.asset(
                qty!.isEven ? "assets/fruits.jpeg" : "assets/burger.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Izumi Set",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "sushi",
                    style: TextStyle(color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$1.5",
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          qty! < 1
                              ? Container()
                              : Text(
                                  "x $qty",
                                  style: TextStyle(color: Colors.black),
                                ),
                        ],
                      ),
                      isEdit!
                          ? Checkbox(value: true, onChanged: (value) {})
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.lightGreenAccent[700],
                              ),
                              padding: EdgeInsets.all(8),
                              child: qty! < 1
                                  ? SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Colors.white,
                                          )),
                                    )
                                  : IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          InkWell(
                                              onTap: onRemove,
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              )),
                                          VerticalDivider(),
                                          InkWell(
                                              onTap: onAdd,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                    ),
                            )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
