import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/screens/home_screen.dart';

class PasswordScreen extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();

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
                            "Back",
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
                              "ENTER CODE",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("from sms"),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: _passwordController,
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22)),
                            ),
                            SizedBox(
                              height: 200,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_passwordController.text == "") {
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
                                  "DONE",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "  Do not receive sms ",
                                    children: [
                                  TextSpan(
                                      text: "Repeat",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            content: Text("Repate"),
                                          ));
                                        },
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.green,
                                      ))
                                ])),
                            SizedBox(
                              height: 20,
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
