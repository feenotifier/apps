import 'dart:convert';

import 'package:apps/sections/constant/constants.dart';
import 'package:apps/sections/generic_class/backbutton.dart';
import 'package:apps/sections/generic_class/buttons.dart';
import 'package:apps/sections/generic_class/text_field.dart';
import 'package:apps/sections/login/enter_password.dart';
import 'package:apps/sections/signup/landing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OtpVerificationScreen extends StatefulWidget {
  final String otp;
  final String email;
  const OtpVerificationScreen({
    Key key,
    this.otp,
    this.email,
  }) : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String enteredOtp;
  String fetchedEmail;

  //check email is present in db or not
  Future<http.Response> isUserOnboarded(
    String email,
  ) async {
    return http.post(
      Uri.parse(
          'http://c081-49-36-183-201.ngrok.io/fn/v1/check-email?email=$email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "email": email,
        },
      ),
    );
  }

  @override
  void initState() {
    fetchedEmail = fetchEmail();
    super.initState();
  }

  String fetchEmail() {
    return widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(5),
          child: RoundBackButton(
            backgroundColor: Color(0xFF6F69AC),
            arrowIconColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Distance_Unit * 4,
              vertical: Distance_Unit * 4,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Distance_Unit * 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "Verification Code",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: Distance_Unit * 5,
                      ),
                      Text(
                        "We have sent the verification code to\nYour Email Id",
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                      SizedBox(
                        height: Distance_Unit * 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ashishchaubey866@gmail.com",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: Distance_Unit * 2,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFFFD6F96),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Distance_Unit * 5,
                      ),
                      GenericTextField(
                        labelText: "OTP",
                        prefixIconName: Icons.mobile_friendly,
                        borderColor: Color(0xFFFD6F96),
                        onChanged: (val) {
                          enteredOtp = val;
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  GenericButtons(
                    title: "Submit",
                    backgroundColor: Color(0xFF6F69AC),
                    textColor: Colors.white,
                    onTap: () async {
                      if (enteredOtp == widget.otp) {
                        http.Response response =
                            await isUserOnboarded(widget.email);
                        if (response != null) {
                          Map<String, dynamic> map = json.decode(response.body);
                          print(map.keys);
                          if (map['data'] == true)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => LoginPasswordScreen(
                                  email: widget.email,
                                ),
                              ),
                            );
                          else
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignupLandingScreen(
                                  email: widget.email,
                                ),
                              ),
                            );
                        }
                      } else
                        print("Otp did not matched");
                      // 209239
                    },
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
