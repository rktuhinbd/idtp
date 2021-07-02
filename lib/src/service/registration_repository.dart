import 'package:idtp/src/model/registration_response.dart';
import 'package:idtp/src/model/user_existence_check_response.dart';
import 'package:idtp/src/model/validate_idtp_user_response.dart';

abstract class IDTPRegistrationRepository {
  Future<UserExistenceCheckResponse> idtpUserExistenceCheck(mobile);

  Future<ValidateIdtpUserResponse> validateIdtpUser(validateIdtpUserRequest);

  Future<RegistrationResponse> registerIdtpUser();
}
