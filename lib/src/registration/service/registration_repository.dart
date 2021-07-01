import 'package:idtp/src/registration/model/registration_response.dart';
import 'package:idtp/src/registration/model/user_existence_check_response.dart';
import 'package:idtp/src/registration/model/validate_idtp_user_response.dart';

abstract class IDTPRegistrationRepository {
  Future<UserExistenceCheckResponse> idtpUserExistenceCheck(String mobile);
  Future<ValidateIdtpUserResponse> validateIdtpUser();
  Future<RegistrationResponse> registerIdtpUser();
}