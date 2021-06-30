import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitSignUpState extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class SignUpFailureState extends SignUpState {
  final String error;

  SignUpFailureState({@required this.error});

  @override
  List<Object> get props => [error];
}
