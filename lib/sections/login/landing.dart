import 'package:apps/sections/constant/constants.dart';
import 'package:apps/sections/generic_class/buttons.dart';
import 'package:apps/sections/generic_class/text_field.dart';
import 'package:apps/sections/shared/otp_verification.dart';
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

  // send OTP

  Future<http.Response> sendOTP(
    String email,
  ) async {
    return http.get(
      Uri.parse(
          'http://c081-49-36-183-201.ngrok.io/account/verification/sendOtp?email=$email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
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

  bool isEmailValid(String em) {
    final regExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    return regExp.hasMatch(em);
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
      backgroundColor: Color.fromRGBO(18, 18, 18, 60),
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
                    ),
                  ),
                  SizedBox(
                    height: Distance_Unit * 7,
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
                        "Fee Notifier",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 198, 137, 40),
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
                  color: Color.fromRGBO(45, 45, 45, 100),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Distance_Unit * 4,
                    right: Distance_Unit * 4,
                    bottom: Distance_Unit * 16,
                    top: Distance_Unit * 10,
                  ),
                  child: Column(
                    children: [
                      GenericTextField(
                        labelText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        prefixIconName: Icons.mail,
                        prefixIconColor: Color.fromRGBO(209, 209, 209, 20),
                        borderColor: Color.fromRGBO(255, 198, 137, 40),
                        focusBorderColor: Color.fromRGBO(255, 198, 137, 40),
                        labelTextColor: Color.fromRGBO(209, 209, 209, 10),
                        textColor: Colors.white,
                        //TODO - change input text color
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: Distance_Unit * 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Distance_Unit * 80,
                        ),
                        child: GenericButtons(
                          title: "Next",
                          backgroundColor: Color.fromRGBO(255, 198, 137, 40),
                          textColor: Colors.black54,
                          suffixIconColor: Colors.black54,
                          suffixIconData: Icons.arrow_forward_ios,
                          onTap: () async {
                            if (isEmailValid(email)) {
                              _onLoading();
                            } else {
                              //TODO show message-  not a valid email
                              print("Not a valid email");
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(
                                      content:
                                          const Text('Email is Not Valid')),
                                );
                            }
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

  void _onLoading() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    http.Response response = await sendOTP(email);
    if (response.body != null && response.body.isNotEmpty) {
      Navigator.pop(context); //pop dialog
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OtpVerificationScreen(
            otp: response.body.toString(),
            email: email,
          ),
        ),
      );
    }
  }
}
