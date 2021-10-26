import 'dart:async';
import 'dart:convert';

import 'package:apps/sections/homepage/home.dart';
import 'package:apps/sections/login/landing.dart';
import 'package:apps/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initScreen();
    super.initState();
  }

  Future<http.Response> isEmailAndPassCorrect(
    String email,
    String password,
  ) async {
    return http.post(
      Uri.parse('http://c081-49-36-183-201.ngrok.io/fn/v1/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        'password': password,
      }),
    );
  }

  String email;
  String password;
  _initScreen() async {
    email = await getEmail();
    password = await getPassword();

    print(email);
    print(password);

    Timer(Duration(seconds: 5), () async {
      if (email != null &&
          email.isNotEmpty &&
          password != null &&
          password.isNotEmpty) {
        http.Response response = await isEmailAndPassCorrect(email, password);
        Map<String, dynamic> map = json.decode(response.body);
        if (map['data']['isLogin'] == true &&
            map['data']['response'] == "SUCCESS")
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        else
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => LoginLandingScreen(),
            ),
          );
      } else
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => LoginLandingScreen(),
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Email $email");
    print("password:$password");
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
