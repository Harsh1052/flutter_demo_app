import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/screens/password_screen.dart';
import 'package:flutter_demo_app/screens/signin_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isCheck = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool isPhoneError = false;
  bool isNameError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.camera_alt,
                                size: 70,
                                color: Colors.white60,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z]"))
                              ],
                              decoration: InputDecoration(
                                  errorText:
                                      isNameError ? "Enter Name First" : null,
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22)),
                              controller: _nameController,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _phoneController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  style: TextStyle(color: Colors.white),
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      errorText: isPhoneError
                                          ? "Enter valid number First"
                                          : null,
                                      counterText: "",
                                      labelText: "Phone",
                                      labelStyle: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("We send you a password in sms"),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                          width: 1.0,
                                          color: Colors.white,
                                        )),
                                        checkColor: Colors.white,
                                        value: isCheck,
                                        onChanged: (value) {
                                          isCheck = value!;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: "  I agree with ",
                                            children: [
                                          TextSpan(
                                              text: "Term & Conditions",
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    content: Text(
                                                        "Terms And Conditions"),
                                                  ));
                                                },
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.green,
                                              ))
                                        ]))
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_nameController.text == "") {
                                    isNameError = true;
                                    setState(() {});
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text("Enter Your Name First"),
                                    ));
                                    return;
                                  }
                                  if (_phoneController.text == "" ||
                                      _phoneController.text.length < 10) {
                                    isNameError = false;
                                    isPhoneError = true;
                                    setState(() {});
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text("Invalid Phone Number"),
                                    ));
                                    return;
                                  }
                                  if (!isCheck) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      content:
                                          Text("Accept Term Conditions First"),
                                    ));
                                    return;
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PasswordScreen()));
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                                text: TextSpan(text: "  I have ", children: [
                              TextSpan(
                                  text: "an account",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen()));
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
