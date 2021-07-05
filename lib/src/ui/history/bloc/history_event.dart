import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class LoadingHistoryEvent extends HistoryEvent {
  const LoadingHistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadedHistoryEvent extends HistoryEvent {
  const LoadedHistoryEvent();

  @override
  List<Object> get props => [];
}
