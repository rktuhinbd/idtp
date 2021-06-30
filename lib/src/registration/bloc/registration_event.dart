import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class LoadingSignUpEvent extends SignUpEvent{
  final bool token;

  const LoadingSignUpEvent({@required this.token});

  @override
  List<Object> get props => [token];
}

class UserSignUpEvent extends SignUpEvent{
  const UserSignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpSuccessEvent extends SignUpEvent{
  final bool account;

  const SignUpSuccessEvent({@required this.account});

  @override
  List<Object> get props => [account];
}
