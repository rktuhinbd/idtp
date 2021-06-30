import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class LoadingRegistrationEvent extends RegistrationEvent{
  final bool token;

  const LoadingRegistrationEvent({@required this.token});

  @override
  List<Object> get props => [token];
}

class UserRegistrationEvent extends RegistrationEvent{
  const UserRegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationSuccessEvent extends RegistrationEvent{
  final bool account;

  const RegistrationSuccessEvent({@required this.account});

  @override
  List<Object> get props => [account];
}
