import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class RtpReceivedState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitRtpReceivedState extends RtpReceivedState {}

class LoadingRtpReceivedState extends RtpReceivedState {}

class LoadedRtpReceivedState extends RtpReceivedState {}

