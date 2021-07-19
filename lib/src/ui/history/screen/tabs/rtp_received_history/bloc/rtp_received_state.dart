import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idtp/src/model/rtp_received_list_response.dart';

@immutable
abstract class RtpReceivedState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitRtpReceivedState extends RtpReceivedState {}

class LoadingRtpReceivedState extends RtpReceivedState {
}

class LoadedRtpReceivedState extends RtpReceivedState {
  final List<Transaction> transactions;

  LoadedRtpReceivedState({this.transactions});

  @override
  List<Object> get props => [transactions];
}

