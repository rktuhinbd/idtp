import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class RtpSentState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitRtpSentState extends RtpSentState {}

class LoadingRtpSentState extends RtpSentState {}

class LoadedRtpSentState extends RtpSentState {}

