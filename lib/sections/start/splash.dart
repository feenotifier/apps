import 'dart:async';

import 'package:apps/sections/homepage/home.dart';
import 'package:apps/sections/login/landing.dart';
import 'package:apps/services/storage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initScreen();
    _isUserOnboarded();
    super.initState();
  }

  _isUserOnboarded() {}

  _initScreen() {
    Timer(Duration(seconds: 5), () async {
      String userId = await getUserID();
      if (userId != null && userId.isNotEmpty)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(),
          ),
        );
      else
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LoginLandingScreen(),
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFD6F96),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Notify just at a tap!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
