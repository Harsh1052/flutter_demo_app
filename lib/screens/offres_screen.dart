import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              height: screenHeight * 0.65,
              child: CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    currentIndex = index;
                    setState(() {});
                  },
                  viewportFraction: 0.75,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  height: screenHeight * 0.65,
                ),
                items: [0, 1, 2, 3, 4].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        elevation: 2,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/fruits.jpeg")),
                          ),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return Container(
                              color: Colors.white,
                              width: constraint.maxWidth,
                              height: 60,
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Classic double stuffed test test",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "Pizza",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "\$14.20",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0, 1, 2, 3, 4].map((i) {
                return Container(
                  margin: EdgeInsets.all(4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          i == currentIndex ? Colors.green : Colors.grey[350]),
                );
              }).toList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.black12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_outline,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "ADD TO FAVOURITE",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.green,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "ADD TO CART",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
