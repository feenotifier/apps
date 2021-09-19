import 'dart:convert';

import 'package:apps/sections/constant/constants.dart';
import 'package:apps/sections/generic_class/buttons.dart';
import 'package:apps/sections/generic_class/text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupLandingScreen extends StatefulWidget {
  const SignupLandingScreen({Key key}) : super(key: key);

  @override
  _SignupLandingScreenState createState() => _SignupLandingScreenState();
}

class _SignupLandingScreenState extends State<SignupLandingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _arrowSlideAnimation;

  Future<http.Response> createAlbum(
    String firstname,
    String lastName,
    String email,
    String phoneNumber,
    String password,
  ) {
    return http.post(
      Uri.parse('https://1281-49-36-181-243.ngrok.io/fn/v1/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": passWord,
      }),
    );
  }

  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String passWord;

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
                    height: Distance_Unit * 4,
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
                        "Welcome",
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
                        labelText: "First Name",
                        prefixIconName: Icons.person,
                        prefixIconColor: Color(0xFF6F69AC),
                        borderColor: Color(0xFF6F69AC),
                        focusBorderColor: Color(0xFFFD6F96),
                        labelTextColor: Color(0xFF6F69AC),
                        onChanged: (val) {
                          firstName = val;
                        },
                      ),
                      SizedBox(
                        height: Distance_Unit * 4,
                      ),
                      GenericTextField(
                        labelText: "Last Name",
                        prefixIconName: Icons.person,
                        prefixIconColor: Color(0xFF6F69AC),
                        borderColor: Color(0xFF6F69AC),
                        focusBorderColor: Color(0xFFFD6F96),
                        labelTextColor: Color(0xFF6F69AC),
                        onChanged: (val) {
                          lastName = val;
                        },
                      ),
                      SizedBox(
                        height: Distance_Unit * 4,
                      ),
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
                      GenericTextField(
                        labelText: "Number",
                        keyboardType: TextInputType.number,
                        prefixIconName: Icons.phone_android,
                        prefixIconColor: Color(0xFF6F69AC),
                        borderColor: Color(0xFF6F69AC),
                        focusBorderColor: Color(0xFFFD6F96),
                        labelTextColor: Color(0xFF6F69AC),
                        onChanged: (val) {
                          phoneNumber = val;
                        },
                      ),
                      SizedBox(
                        height: Distance_Unit * 4,
                      ),
                      GenericTextField(
                        labelText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        prefixIconName: Icons.lock,
                        prefixIconColor: Color(0xFF6F69AC),
                        borderColor: Color(0xFF6F69AC),
                        focusBorderColor: Color(0xFFFD6F96),
                        labelTextColor: Color(0xFF6F69AC),
                        onChanged: (val) {
                          passWord = val;
                        },
                      ),
                      SizedBox(
                        height: Distance_Unit * 4,
                      ),
                      GenericTextField(
                        labelText: "Confirm Password",
                        prefixIconName: Icons.check_circle,
                        prefixIconColor: Color(0xFF6F69AC),
                        borderColor: Color(0xFF6F69AC),
                        focusBorderColor: Color(0xFFFD6F96),
                        labelTextColor: Color(0xFF6F69AC),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Distance_Unit * 10,
                        ),
                        child: GenericButtons(
                          title: "Signup",
                          backgroundColor: Color(0xFFFD6F96),
                          textColor: Colors.white,

                          onTap: () async {
                            http.Response response = await createAlbum(

                              firstName,
                              lastName,
                              email,
                              phoneNumber,
                              passWord,
                            );

                            print(response.body);

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
