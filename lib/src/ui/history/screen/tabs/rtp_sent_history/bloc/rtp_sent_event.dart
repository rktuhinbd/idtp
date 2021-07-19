import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idtp/src/model/rtp_sent_list_request.dart';

abstract class RtpSentEvent extends Equatable {
  const RtpSentEvent();
}

class LoadingRtpSentEvent extends RtpSentEvent {
  final RtpSentListRequest rtpSentListRequest;

  const LoadingRtpSentEvent({@required this.rtpSentListRequest});

  @override
  List<Object> get props => [rtpSentListRequest];
}

class LoadedRtpSentEvent extends RtpSentEvent {
  const LoadedRtpSentEvent();

  @override
  List<Object> get props => [];
}
