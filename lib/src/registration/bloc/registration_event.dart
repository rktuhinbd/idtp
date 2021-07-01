import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class InitRegistrationEvent extends RegistrationEvent{

  const InitRegistrationEvent();

  @override
  List<Object> get props => [];
}

class UserExistenceCheckerEvent extends RegistrationEvent{
  final String mobile;

  const UserExistenceCheckerEvent({@required this.mobile});

  @override
  List<Object> get props => [mobile];

  @override
  String toString() {
    return 'UserExistenceCheckerEvent{mobile: $mobile}';
  }
}

class UserRegistrationEvent extends RegistrationEvent{
  final String mobile;

  const UserRegistrationEvent({@required this.mobile});

  @override
  List<Object> get props => [mobile];
}

class RegistrationSuccessEvent extends RegistrationEvent{
  final bool account;

  const RegistrationSuccessEvent({@required this.account});

  @override
  List<Object> get props => [account];
}
