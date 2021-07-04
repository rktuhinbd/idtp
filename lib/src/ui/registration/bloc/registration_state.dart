import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class RegistrationState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitRegistrationState extends RegistrationState {}

class LoadingRegistrationState extends RegistrationState {}

class UserValidationState extends RegistrationState {}

class UserRegistrationState extends RegistrationState {}
