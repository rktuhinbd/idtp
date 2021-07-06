import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CreateRTPState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitCreateRTPState extends CreateRTPState {}

class LoadingCreateRTPState extends CreateRTPState {}

class LoadedCreateRTPState extends CreateRTPState {
}

