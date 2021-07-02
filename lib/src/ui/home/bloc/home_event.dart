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

class UserExistenceCheckEvent extends HomeEvent{
  final String mobile;

  const UserExistenceCheckEvent({@required this.mobile});

  @override
  List<Object> get props => [mobile];

  @override
  String toString() {
    return 'UserExistenceCheckerEvent{mobile: $mobile}';
  }
}

class LoadedHomeEvent extends HomeEvent{
  const LoadedHomeEvent();

  @override
  List<Object> get props => [];
}
