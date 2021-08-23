import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/cubit/myCubit.dart';
import 'package:flutter_demo_app/screens/welcome_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'constants.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (kDebugMode) {
    // Force disable Crashlytics collection while doing every day development.
    // Temporarily toggle this to true if you want to test crash reporting in your app.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    // Handle Crashlytics enabled status when not in Debug,
    // e.g. allow your users to opt-in to crash reporting.
  }
  runApp(BlocProvider(create: (context) => MyCubit(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        accentIconTheme:
            Theme.of(context).accentIconTheme.copyWith(color: Colors.white),
        canvasColor: Colors.black54,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        unselectedWidgetColor: Colors.white,
        textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
            bodyText1: TextStyle(color: Colors.white)),
        primarySwatch: myColor,
      ),
      home: WelcomeScreen(),
    );
  }
}
