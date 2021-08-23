import 'package:flutter/material.dart';
import 'package:flutter_demo_app/custom_widgets/cart_widget.dart';
import 'package:flutter_demo_app/custom_widgets/message_widget.dart';

class FoodDetailsScreen extends StatefulWidget {
  final String? imagePath;
  final String? foodName;
  final String? descriptions;
  final String? price;

  FoodDetailsScreen(
      {this.foodName, this.descriptions, this.imagePath, this.price});

  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int currentIndex = 0;
  bool isAddToCart = false;
  int counter = 0;

  List<MessageWidget> messages = [
    MessageWidget(
      personName: "Harsh",
      message: " hgdshvjchducydgjchbv hhcgdjgjc hgvbjsdhgvb hcfvdjbvcjsh.",
    ),
    MessageWidget(
      personName: "Harsh",
      message: " hgdshvjchducydgjchbv hhcgdjgjc hgvbjsdhgvb hcfvdjbvcjsh.",
    ),
    MessageWidget(
      personName: "Harsh",
      message: " hgdshvjchducydgjchbv hhcgdjgjc hgvbjsdhgvb hcfvdjbvcjsh.",
    ),
    MessageWidget(
      personName: "Harsh",
      message: " hgdshvjchducydgjchbv hhcgdjgjc hgvbjsdhgvb hcfvdjbvcjsh.",
    ),
    MessageWidget(
      personName: "Harsh",
      message: " hgdshvjchducydgjchbv hhcgdjgjc hgvbjsdhgvb hcfvdjbvcjsh.",
    ),
    MessageWidget(
      personName: "Harsh",
      message: " hgdshvjchducydgjchbv hhcgdjgjc hgvbjsdhgvb hcfvdjbvcjsh.",
    ),
    MessageWidget(
      personName: "Harsh",
      message: " hgdshvjchducydgjchbv hhcgdjgjc hgvbjsdhgvb hcfvdjbvcjsh.",
    ),
  ];
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [CartIcon(numberOfOrder: counter.toString())],
        title: Text(
          widget.foodName ?? "",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Stack(
            children: [
              PageView(
                children: List.generate(
                  3,
                  (index) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.imagePath!))),
                  ),
                ),
                onPageChanged: (int index) {
                  currentIndex = index;
                  setState(() {});
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? Colors.green
                                      : Colors.grey,
                                  shape: BoxShape.circle),
                            )),
                  ),
                  Container(
                    color: Colors.black38,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.descriptions ?? "not available",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            widget.price ?? "N/A",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black12,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_outline,
                      ),
                      Text(
                        "ADD TO FAVOURITE",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.green,
                  child: counter > 0
                      ? Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  counter--;

                                  setState(() {});
                                },
                                child: Container(
                                  color: Colors.green,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.green,
                                child: Center(
                                    child: Text(
                                  "x $counter",
                                  style: TextStyle(fontSize: 18),
                                )),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  counter++;
                                  setState(() {});
                                },
                                child: Container(
                                  color: Colors.green,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            counter++;
                            setState(() {});
                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              Text("ADD TO CART")
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Comments(324)",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                            verticalDirection: VerticalDirection.up,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: messages),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Container(
            color: Colors.white70,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                    child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      hintText: "Your Messages..."),
                )),
                InkWell(
                  onTap: () {
                    if (_messageController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Write Message First"),
                        backgroundColor: Colors.yellow[700],
                      ));
                      return;
                    }
                    _scrollController.animateTo(
                        _scrollController.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.ease);
                    messages.add(MessageWidget(
                      personName: "Harsh",
                      message: _messageController.text,
                    ));
                    _messageController.clear();
                    FocusScope.of(context).unfocus();
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.lightGreen,
                    padding: EdgeInsets.all(15),
                    child: Text("SEND"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
