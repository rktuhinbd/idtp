import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:idtp/src/model/registration_request.dart';
import 'package:idtp/src/model/registration_response.dart';
import 'package:idtp/src/model/user_existence_check_response.dart';
import 'package:idtp/src/model/validate_idtp_user_request.dart';
import 'package:idtp/src/model/validate_idtp_user_response.dart';
import 'package:idtp/src/utils/toast.dart';

import 'registration_repository.dart';

class RegistrationService implements IDTPRegistrationRepository {
  static const _baseUrl = 'http://103.43.55.23:31001/';
  static const String _userExistenceCheckUrl = 'api/user/';
  static const String _userValidationUrl = 'management/ValidateIDTPUser';
  static const String _userRegistrationUrl = 'management/RegisterIDTPUser';

  Future<UserExistenceCheckResponse> idtpUserExistenceCheck(mobile) async {
    Uri uri = Uri.parse(_baseUrl + _userExistenceCheckUrl + "$mobile");

    try {
      Response response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return userExistenceCheckResponseFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<ValidateIdtpUserResponse> validateIdtpUser(
      validateIdtpUserRequest) async {
    final uri = Uri.parse(_baseUrl + _userValidationUrl);
    final headers = {'Content-Type': 'application/json'};
    final encoding = Encoding.getByName('utf-8');

    try {
      Response response = await http.post(
        uri,
        headers: headers,
        body: validateIdtpUserRequestToJson(validateIdtpUserRequest),
        encoding: encoding,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Response: " + response.body);
        return validateIdtpUserResponseFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<RegistrationResponse> registerIdtpUser(registrationRequest) async {
    final uri = Uri.parse(_baseUrl + _userRegistrationUrl);
    final headers = {'Content-Type': 'application/json'};
    final encoding = Encoding.getByName('utf-8');

    try {
      Response response = await http.post(
        uri,
        headers: headers,
        body: registerUserRequestToJson(registrationRequest),
        encoding: encoding,
      );

      showToast("Registration Unsuccessful");

      print("Registration Response: " + response.body);

      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   print("Registration Response: " + response.body);
      //   return registerIdtpUser(response.body);
      // }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
