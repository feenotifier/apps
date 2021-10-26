import 'dart:convert';

import 'package:http/http.dart' as http;

String baseUrl = "http://c081-49-36-183-201.ngrok.io";

//Send OTP to verify email
Future<http.Response> sendOTP(
  String email,
) async {
  return http.get(
    Uri.parse('$baseUrl/account/verification/sendOtp?email=$email'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

//isUserOnboarded API -> Check if user's email is present in DB or not
Future<http.Response> isUserOnboarded(
  String email,
) async {
  return http.post(
    Uri.parse('$baseUrl/fn/v1/check-email?email=$email'),
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

//Login API -> Verify Email and Password
Future<http.Response> isEmailAndPassCorrect(
  String email,
  String password,
) async {
  return http.post(
    Uri.parse('$baseUrl/fn/v1/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "email": email,
      'password': password,
    }),
  );
}

//Signup API
Future<http.Response> signupUser(
  String firstName,
  String lastName,
  String phoneNumber,
  String email,
  String password,
) async {
  return http.post(
    Uri.parse('$baseUrl/fn/v1/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password
    }),
  );
}
