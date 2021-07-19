import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idtp/src/model/rtp_sent_list_response.dart';

@immutable
abstract class RtpSentState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitRtpSentState extends RtpSentState {}

class LoadingRtpSentState extends RtpSentState {}

class LoadedRtpSentState extends RtpSentState {
  final List<Transaction> transactions;

  LoadedRtpSentState({this.transactions});

  @override
  List<Object> get props => [transactions];
}
