import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class LoadingDashboardEvent extends DashboardEvent {
  const LoadingDashboardEvent();

  @override
  List<Object> get props => [];
}

class LoadedDashboardEvent extends DashboardEvent {
  const LoadedDashboardEvent();

  @override
  List<Object> get props => [];
}
