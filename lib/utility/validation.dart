bool isEmailValid(String email) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(email);
}

bool isPasswordValid(String password) {
  String p =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,15}$';
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(password);
}

bool isPhoneNumberValid(String phone) {
  String p = r'^[6-9]\d{9}';
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(phone);
}

bool isNameValid(String name) {
  String p = r"^[a-z ,.'-]+$";
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(name);
}
