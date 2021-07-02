import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class UserExistenceCheckState extends HomeState {}

class IsRegistrationPossibleState extends HomeState {
  bool isRegistrationPossible;

  IsRegistrationPossibleState({@required isRegistrationPossible});

  @override
  List<Object> get props => [isRegistrationPossible];
}
