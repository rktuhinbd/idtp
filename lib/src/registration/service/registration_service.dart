import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:idtp/src/registration/model/album.dart';
import 'package:idtp/src/registration/model/user_existance_check_response.dart';
import 'package:idtp/src/registration/model/user_registration_response.dart';
import 'package:idtp/src/registration/model/user_validation_response.dart';

import 'registration_repository.dart';

class RegistrationService implements AlbumsRepository {
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _userExistenceCheckUrl = '/check-existence';
  static const String _userValidationUrl = '/validate';
  static const String _userRegistrationUrl = '/register';

  @override
  Future<UserExistenceCheckResponse> idtpUserExistenceCheck() async {
    Uri uri = Uri.https(_baseUrl, _userExistenceCheckUrl);

    Response response = await http.get(uri);
    UserExistenceCheckResponse existenceCheckResponse = response.body as UserExistenceCheckResponse;

    return existenceCheckResponse;
  }

  @override
  Future<UserValidationResponse> validateIdtpUser() async {
    Uri uri = Uri.https(_baseUrl, _userValidationUrl);

    Response response = await http.get(uri);
    UserValidationResponse userValidationResponse = response.body as UserValidationResponse;

    return userValidationResponse;
  }

  @override
  Future<UserRegistrationResponse> registerIdtpUser() async {
    Uri uri = Uri.https(_baseUrl, _userRegistrationUrl);

    Response response = await http.get(uri);
    UserRegistrationResponse userRegistrationResponse = response.body as UserRegistrationResponse;

    return userRegistrationResponse;
  }

}
