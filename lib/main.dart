import 'package:apps/sections/signup/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return SignupLandingScreen();
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SignupLandingScreen()));
            },
            child: Text("Test SignUp Screen"),
          ),
        ),
      ),
    );
  }
}
