import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:idtp/src/registration/model/registration_response.dart';
import 'package:idtp/src/registration/model/user_existence_check_response.dart';
import 'package:idtp/src/registration/model/validate_idtp_user_response.dart';

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

  Future<ValidateIdtpUserResponse> validateIdtpUser() async {
    Uri uri = Uri.https(_baseUrl, _userValidationUrl);

    Response response = await http.post(uri);
    ValidateIdtpUserResponse validateIDTPUserRequest =
        response.body as ValidateIdtpUserResponse;

    return validateIDTPUserRequest;
  }

  Future<RegistrationResponse> registerIdtpUser() async {
    Uri uri = Uri.https(_baseUrl, _userRegistrationUrl);

    Response response = await http.post(uri);
    RegistrationResponse registrationResponse =
        response.body as RegistrationResponse;

    return registrationResponse;
  }
}
