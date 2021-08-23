import 'package:flutter/material.dart';
import 'package:flutter_demo_app/screens/home_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _forgotPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.8), BlendMode.srcOver),
                      fit: BoxFit.cover,
                      image: AssetImage("assets/background_image.jpeg"))),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.keyboard_arrow_left),
                            color: Colors.white,
                            iconSize: 30,
                          ),
                          Text(
                            "Cancel",
                            style: TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          children: [
                            Text(
                              "FORGOT PASSWORD",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("we send you a password in sms"),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: _forgotPasswordController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "Enter Password",
                                  labelStyle: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22)),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_forgotPasswordController.text == "") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text("Invalid Password"),
                                    ));
                                    return;
                                  }
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                      (route) => false);
                                },
                                child: Text(
                                  "SEND",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
