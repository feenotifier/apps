import 'package:apps/sections/constant/constants.dart';
import 'package:apps/sections/generic_class/backbutton.dart';
import 'package:apps/sections/generic_class/buttons.dart';
import 'package:apps/sections/generic_class/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key key}) : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
              height: MediaQuery.of(context).size.height * 0.91,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Distance_Unit * 10,
                  ),
                  Center(
                    child: Container(
                      child: SvgPicture.asset(
                        "assets/svg/otp_mobile.svg",
                        height: 150,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Distance_Unit * 15,
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
                      ),
                    ],
                  ),
                  Spacer(),
                  GenericButtons(
                    title: "Submit",
                    backgroundColor: Color(0xFF6F69AC),
                    textColor: Colors.white,
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
