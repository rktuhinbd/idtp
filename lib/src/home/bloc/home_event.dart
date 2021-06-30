import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadingHomeEvent extends HomeEvent{
  final bool token;

  const LoadingHomeEvent({@required this.token});

  @override
  List<Object> get props => [token];
}

class LoadedHomeEvent extends HomeEvent{
  const LoadedHomeEvent();

  @override
  List<Object> get props => [];
}
