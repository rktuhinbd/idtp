import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class RegistrationState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitRegistrationState extends RegistrationState {}

class UserExistenceCheckState extends RegistrationState {}

class RegistrationFailureState extends RegistrationState {
  final String error;

  RegistrationFailureState({@required this.error});

  @override
  List<Object> get props => [error];
}
