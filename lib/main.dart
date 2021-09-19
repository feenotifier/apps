import 'package:apps/sections/login/landing.dart';
import 'package:apps/sections/signup/landing.dart';
import 'package:apps/sections/start/splash.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignupLandingScreen()));
                },
                child: Text("Test SignUp Screen"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginLandingScreen()));
                },
                child: Text("Test Login Screen"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SplashScreen()));
                },
                child: Text("Test Splash Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
