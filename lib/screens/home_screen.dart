import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/cubit/myCubit.dart';
import 'package:flutter_demo_app/custom_widgets/cart_widget.dart';
import 'package:flutter_demo_app/screens/cart_screen.dart';
import 'package:flutter_demo_app/screens/dashboard_screen.dart';
import 'package:flutter_demo_app/screens/favourite_screen.dart';
import 'package:flutter_demo_app/screens/last_order_screen.dart';
import 'package:flutter_demo_app/screens/offres_screen.dart';
import 'package:flutter_demo_app/screens/setting_screen.dart';
import 'package:flutter_demo_app/screens/support_screen.dart';

class HomeScreen extends StatefulWidget {
  final String? userName;

  HomeScreen({this.userName});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreenIndex = 0;
  String currentScreenName = "Menu";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> screens = [
    DashBoardScreen(),
    OfferScreen(),
    CartScreen(),
    LastOrderScreen(),
    FavouriteScreen(),
    SettingScreen(),
    SupportScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          currentScreenIndex == 5
              ? Container()
              : currentScreenIndex == 3
                  ? CartIcon(
                      numberOfOrder: "2",
                    )
                  : currentScreenIndex == 4
                      ? BlocProvider(
                          create: (BuildContext context) {
                            return MyCubit();
                          },
                          child: InkWell(
                            onTap: () {
                              context.read<MyCubit>().changeValue();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            FirebaseCrashlytics.instance.crash();
                          },
                          icon: Icon(Icons.search),
                          color: Colors.white,
                        )
        ],
        title: Text(
          currentScreenName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Container(
        width: screenWidth * 0.7,
        child: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/profile_photo.jpeg"))),
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.userName ?? "Name Not Found",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              )),
              ListTile(
                onTap: () {
                  currentScreenName = "Menu";
                  currentScreenIndex = 0;
                  _scaffoldKey.currentState!.openEndDrawer();
                  setState(() {});
                },
                leading: Icon(
                  Icons.dinner_dining,
                  color: Colors.white,
                ),
                title: Text(
                  "Menu",
                  style: TextStyle(),
                ),
              ),
              ListTile(
                onTap: () {
                  currentScreenName = "Offers";
                  currentScreenIndex = 1;
                  _scaffoldKey.currentState!.openEndDrawer();
                  setState(() {});
                },
                leading: Icon(
                  Icons.local_offer_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Offers",
                  style: TextStyle(fontSize: 17),
                ),
                trailing: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Center(child: Text("5")),
                ),
              ),
              ListTile(
                onTap: () {
                  currentScreenName = "Cart";
                  currentScreenIndex = 2;
                  _scaffoldKey.currentState!.openEndDrawer();
                  setState(() {});
                },
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "My Cart",
                  style: TextStyle(fontSize: 17),
                ),
                trailing: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Center(child: Text("3")),
                ),
              ),
              ListTile(
                onTap: () {
                  currentScreenName = "Last Order";
                  currentScreenIndex = 3;
                  _scaffoldKey.currentState!.openEndDrawer();
                  setState(() {});
                },
                leading: Icon(
                  Icons.history_toggle_off,
                  color: Colors.white,
                ),
                title: Text(
                  "Last Order",
                  style: TextStyle(),
                ),
              ),
              ListTile(
                onTap: () {
                  currentScreenName = "Favourite";
                  currentScreenIndex = 4;
                  _scaffoldKey.currentState!.openEndDrawer();
                  setState(() {});
                },
                leading: Icon(
                  Icons.star_outline,
                  color: Colors.white,
                ),
                title: Text(
                  "Favourite",
                  style: TextStyle(),
                ),
              ),
              ListTile(
                onTap: () {
                  currentScreenName = "Setting";
                  currentScreenIndex = 5;
                  _scaffoldKey.currentState!.openEndDrawer();
                  setState(() {});
                },
                leading: Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Setting",
                  style: TextStyle(),
                ),
              ),
              ListTile(
                onTap: () {
                  currentScreenName = "Support";
                  currentScreenIndex = 6;
                  _scaffoldKey.currentState!.openEndDrawer();
                  setState(() {});
                },
                leading: Icon(
                  Icons.feedback_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Support",
                  style: TextStyle(),
                ),
              )
            ],
          ),
        ),
      ),
      body: screens[currentScreenIndex],
    );
  }
}
