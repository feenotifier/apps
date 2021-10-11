import 'dart:convert';

import 'package:apps/sections/constant/constants.dart';
import 'package:apps/sections/generic_class/buttons.dart';
import 'package:apps/sections/generic_class/text_field.dart';
import 'package:apps/sections/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginLandingScreen extends StatefulWidget {
  const LoginLandingScreen({Key key}) : super(key: key);

  @override
  _LoginLandingScreenState createState() => _LoginLandingScreenState();
}

class _LoginLandingScreenState extends State<LoginLandingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _arrowSlideAnimation;
  String email;
  String password;

  Future<http.Response> createAlbum(
    String email,
    String password,
  ) async {
    return http.post(
      Uri.parse('https://1281-49-36-181-243.ngrok.io/fn/v1/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );
  }

  @override
  void initState() {
    _initAnimationController();
    _animationController.forward();
    _initArrowSlideAnimation();
    super.initState();
  }

  _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
  }

  _initArrowSlideAnimation() {
    _arrowSlideAnimation = Tween<Offset>(
      begin: Offset(-2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFD6F96),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                Distance_Unit * 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: _animationController,
                    child: SlideTransition(
                      position: _arrowSlideAnimation,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: Distance_Unit * 2,
                        ),
                        height: Distance_Unit * 10,
                        width: Distance_Unit * 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            Distance_Unit * 12,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFF6F69AC),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Distance_Unit * 12,
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, 0.3),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeIn,
                      ),
                    ),
                    child: Container(
                      child: Text(
                        "Welcome to \nFee Notifier",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            FadeTransition(
              opacity: _animationController,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Distance_Unit * 4,
                    right: Distance_Unit * 4,
                    bottom: Distance_Unit * 4,
                    top: Distance_Unit * 15,
                  ),
                  child: Column(
                    children: [
                      GenericTextField(
                        labelText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        prefixIconName: Icons.mail,
                        prefixIconColor: Color(0xFF6F69AC),
                        borderColor: Color(0xFF6F69AC),
                        focusBorderColor: Color(0xFFFD6F96),
                        labelTextColor: Color(0xFF6F69AC),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: Distance_Unit * 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Distance_Unit * 20,
                        ),
                        child: GenericButtons(
                          title: "Next",
                          backgroundColor: Color(0xFFFD6F96),
                          textColor: Colors.white,
                          suffixIconColor: Colors.white,
                          suffixIconData: Icons.arrow_forward_ios,
                          onTap: () async {
                            // http.Response response = await createAlbum(
                            //   email,
                            //   password,
                            // );
                            // Map<String, dynamic> map =
                            //     json.decode(response.body);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomePage(
                                    // userId: map['data']['userId'],
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
