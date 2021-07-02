import 'package:equatable/equatable.dart';
import 'package:idtp/src/model/validate_idtp_user_request.dart';
import 'package:meta/meta.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class InitRegistrationEvent extends RegistrationEvent{

  const InitRegistrationEvent();

  @override
  List<Object> get props => [];
}

class UserValidationEvent extends RegistrationEvent{
  final ValidateIdtpUserRequest validateIdtpUserRequest;

  const UserValidationEvent({@required this.validateIdtpUserRequest});

  @override
  List<Object> get props => [validateIdtpUserRequest];

  @override
  String toString() {
    return 'UserValidationEvent{validateIdtpUserRequest: $validateIdtpUserRequest}';
  }
}

// class UserRegistrationEvent extends RegistrationEvent{
//   final String mobile;
//
//   const UserRegistrationEvent({@required this.mobile});
//
//   @override
//   List<Object> get props => [mobile];
// }

class RegistrationSuccessEvent extends RegistrationEvent{
  final bool account;

  const RegistrationSuccessEvent({@required this.account});

  @override
  List<Object> get props => [account];
}
