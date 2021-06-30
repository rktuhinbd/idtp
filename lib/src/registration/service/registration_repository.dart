import 'package:idtp/src/registration/model/user_existance_check_response.dart';
import 'package:idtp/src/registration/model/user_registration_response.dart';
import 'package:idtp/src/registration/model/user_validation_response.dart';

abstract class AlbumsRepository {
  Future<UserExistenceCheckResponse> idtpUserExistenceCheck();
  Future<UserValidationResponse> validateIdtpUser();
  Future<UserRegistrationResponse> registerIdtpUser();
}