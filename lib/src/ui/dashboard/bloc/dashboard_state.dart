import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DashboardState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitDashboardState extends DashboardState {}

class LoadingDashboardState extends DashboardState {}

class LoadedDashboardState extends DashboardState {}

