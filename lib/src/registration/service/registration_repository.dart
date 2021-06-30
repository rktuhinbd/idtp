import 'package:idtp/src/registration/model/registration_response.dart';
import 'package:idtp/src/registration/model/user_existance_check_response.dart';
import 'package:idtp/src/registration/model/validate_idtp_user_response.dart';

abstract class AlbumsRepository {
  Future<UserExistenceCheckResponse> idtpUserExistenceCheck();
  Future<ValidateIdtpUserResponse> validateIdtpUser();
  Future<RegistrationResponse> registerIdtpUser();
}