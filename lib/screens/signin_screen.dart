import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/screens/home_screen.dart';
import 'package:flutter_demo_app/screens/signup_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isPhoneError = false;
  bool isPasswordError = false;
  String? userName;

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
                              "SIGN IN",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("enter your data"),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: _phoneController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(color: Colors.white),
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  errorText:
                                      isPhoneError ? "invalid number" : null,
                                  counterText: "",
                                  labelText: "Phone",
                                  labelStyle: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _passwordController,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      errorText: isPasswordError
                                          ? "invalid number"
                                          : null,
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordScreen()));
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Colors.green,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_phoneController.text == "" ||
                                      _phoneController.text.length < 10) {
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
                                  if (_passwordController.text == "") {
                                    isPasswordError = true;
                                    isPhoneError = false;
                                    setState(() {});
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text("Invalid Password"),
                                    ));
                                    return;
                                  }
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                },
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "OR",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: () async {
                                  bool success = await withGoogleSignUp();
                                  if (success) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen(
                                                  userName: userName,
                                                )));
                                  } else {
                                    print("Something Went Wrong");
                                  }
                                },
                                child: Text(
                                  "Sign in with Google",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: () async {
                                  bool success = await withFacebookSingUp();

                                  if (success) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen(
                                                  userName: userName,
                                                )));
                                  } else {
                                    print("Something Went Wrong");
                                  }
                                },
                                child: Text(
                                  "Sing in with Facebook",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blue[800])),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            RichText(
                                text: TextSpan(text: "  New here? ", children: [
                              TextSpan(
                                  text: "SIgn Up",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()));
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

  Future<bool> withGoogleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // ignore: unnecessary_null_comparison

      userName = userCredential.user!.displayName;
      return userCredential == null ? false : true;
    } on FirebaseAuthException catch (e) {
      print("Error:-$e");
      return false;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<dynamic> withFacebookSingUp() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential

      var user = await FacebookAuth.instance.getUserData();
      userName = user["name"];

      return credential == null ? false : true;
    }
    return null;
  }
}
