import 'package:equatable/equatable.dart';
import 'package:idtp/src/model/registration_request.dart';
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

class UserRegistrationEvent extends RegistrationEvent{
  final RegistrationRequest registrationRequest;

  const UserRegistrationEvent({@required this.registrationRequest});

  @override
  List<Object> get props => [registrationRequest];

  @override
  String toString() {
    return 'UserRegistrationEvent{registrationRequest: $registrationRequest}';
  }
}

class UserRegistrationSuccessfulEvent extends RegistrationEvent{
  final bool isRegistrationSuccessful;

  const UserRegistrationSuccessfulEvent({@required this.isRegistrationSuccessful});

  @override
  List<Object> get props => [isRegistrationSuccessful];

  @override
  String toString() {
    return 'UserRegistrationSuccessfulEvent{isRegistrationSuccessful: $isRegistrationSuccessful}';
  }
}

