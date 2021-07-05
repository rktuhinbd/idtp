import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HistoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitHistoryState extends HistoryState {}

class LoadingHistoryState extends HistoryState {}

class LoadedHistoryState extends HistoryState {}

