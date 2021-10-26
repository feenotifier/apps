import 'dart:convert';

import 'package:apps/sections/constant/constants.dart';
import 'package:apps/sections/generic_class/buttons.dart';
import 'package:apps/sections/generic_class/text_field.dart';
import 'package:apps/sections/homepage/home.dart';
import 'package:apps/services/api.dart';
import 'package:apps/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupLandingScreen extends StatefulWidget {
  final String email;
  const SignupLandingScreen({
    Key key,
    this.email,
  }) : super(key: key);

  @override
  _SignupLandingScreenState createState() => _SignupLandingScreenState();
}

class _SignupLandingScreenState extends State<SignupLandingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _arrowSlideAnimation;

  String firstName;
  String lastName;
  String phoneNumber;
  String password;

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

  String step = "firstStep";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFFD6F96),
      appBar: AppBar(
        backgroundColor: Color(0xFFFD6F96),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FadeTransition(
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
        ),
      ),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
          ),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
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
                              "Let's Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
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
                            if (step == "firstStep") ...[
                              GenericTextField(
                                labelText: "First Name",
                                keyboardType: TextInputType.emailAddress,
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
                                keyboardType: TextInputType.emailAddress,
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
                                labelText: "Mobile Number",
                                keyboardType: TextInputType.emailAddress,
                                prefixIconName: Icons.phone,
                                prefixIconColor: Color(0xFF6F69AC),
                                borderColor: Color(0xFF6F69AC),
                                focusBorderColor: Color(0xFFFD6F96),
                                labelTextColor: Color(0xFF6F69AC),
                                onChanged: (val) {
                                  phoneNumber = val;
                                },
                              ),
                            ],
                            if (step == "finalStep") ...[
                              GenericTextField(
                                labelText: "Password",
                                keyboardType: TextInputType.emailAddress,
                                prefixIconName: Icons.remove_red_eye,
                                prefixIconColor: Color(0xFF6F69AC),
                                borderColor: Color(0xFF6F69AC),
                                focusBorderColor: Color(0xFFFD6F96),
                                labelTextColor: Color(0xFF6F69AC),
                                onChanged: (val) {
                                  password = val;
                                },
                              ),
                              SizedBox(
                                height: Distance_Unit * 4,
                              ),
                              GenericTextField(
                                labelText: "Confirm Password",
                                keyboardType: TextInputType.emailAddress,
                                prefixIconName: Icons.password,
                                prefixIconColor: Color(0xFF6F69AC),
                                borderColor: Color(0xFF6F69AC),
                                focusBorderColor: Color(0xFFFD6F96),
                                labelTextColor: Color(0xFF6F69AC),
                              ),
                            ],
                            SizedBox(
                              height: Distance_Unit * 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: Distance_Unit * 20,
                              ),
                              child: GenericButtons(
                                title: step == "firstStep" ? "Next" : "Submit",
                                backgroundColor: Color(0xFFFD6F96),
                                textColor: Colors.white,
                                suffixIconColor: Colors.white,
                                suffixIconData: step == "firstStep"
                                    ? Icons.arrow_forward_ios
                                    : null,
                                onTap: () async {
                                  if (step == "firstStep") {
                                    setState(() {
                                      step = "finalStep";
                                    });
                                  }
                                  if (step == "finalStep" &&
                                      password != null &&
                                      password.isNotEmpty) {
                                    http.Response response = await signupUser(
                                      firstName,
                                      lastName,
                                      phoneNumber,
                                      widget.email,
                                      password,
                                    );

                                    Map<String, dynamic> map =
                                        json.decode(response.body);
                                    print(response.body);
                                    if (map['data']['isCreated'] == true) {
                                      setEmail(widget.email);
                                      setPassword(password);
                                      print(widget.email);
                                      print(password);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => HomePage(),
                                        ),
                                      );
                                    } else
                                      print("Not created");
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
          ),
        ),
      ),
    );
  }
}
