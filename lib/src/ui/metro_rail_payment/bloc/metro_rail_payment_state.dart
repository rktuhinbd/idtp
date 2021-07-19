import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MetroRailPaymentState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitMetroRailPaymentState extends MetroRailPaymentState {}

class LoadingMetroRailPaymentState extends MetroRailPaymentState {}

class LoadedMetroRailPaymentState extends MetroRailPaymentState {
}

