import 'package:validators/validators.dart';

/// Name validation
String validateName(String value) {
  final RegExp regExp = RegExp(r".[a-z A-Z]");

  if (value.isEmpty) {
    return "Name can't be empty";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter valid name";
  } else
    return null;
}

/// Phone number validation
String validatePhone(String value) {
  String pattern = r"[0-9]";
  RegExp regExp = new RegExp(pattern);

  if (value.isEmpty) {
    return "Phone number can't be empty";
  } else if (value.length != 11) {
    return "Password length should be 11 digits";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter valid mobile number";
  } else
    return null;
}

/// Email validation
String validateEmail(String value) {
  if (value.isEmpty) {
    return "Email can't be empty";
  } else if (!isEmail(value)) {
    return "Please enter valid email address";
  } else
    return null;
}

/// VID validation
String validateVID(String value) {
  if (value.isEmpty) {
    return "Virtual ID can't be empty";
  } else if (!isEmail(value)) {
    return "Please enter valid Virtual ID";
  } else
    return null;
}

/// Password validation
String validatePassword(String value, String password, bool validateConfirm) {

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  RegExp regExp = new RegExp(pattern);

  if (value.isEmpty) {
    return "Password can't be empty";
  } else if (value.length < 6) {
    return "Password length should be at least 6";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter a strong password";
  } else if (validateConfirm && value != password) {
    return "Confirm password doesn't match";
  } else
    return null;
}

/// Idtp pin validation
String validateIdtpPin(String value, String idtp, bool confirmIdtp) {

  String pattern = r'^[0-9]+$';
  RegExp regExp = new RegExp(pattern);

  if (value.isEmpty) {
    return "IDTP pin can't be empty";
  } else if (value.length < 4) {
    return "IDTP pin length should be at least 4";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter only numbers as input";
  } else if (confirmIdtp && value != idtp) {
    return "Confirm Idtp pin doesn't match";
  } else
    return null;
}

/// Account number validation
String validateAccountNumber(String value) {
  if (value.isEmpty) {
    return "Account number can't be empty";
  } else if (value.length != 13) {
    return "Password length should be 13 digits";
  } else if (!isNumeric(value)) {
    return "Please enter valid account number";
  } else
    return null;
}

/// Card number validation
String validateCardNumber(String value) {
  if (value.isEmpty) {
    return "Card number can't be empty";
  } else if (value.length != 16) {
    return "Card number length should be 16 digits";
  } else if (isCreditCard(value)) {
    return "Please enter valid card number";
  } else
    return null;
}