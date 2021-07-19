import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idtp/src/model/rtp_received_list_request.dart';

abstract class RtpReceivedEvent extends Equatable {
  const RtpReceivedEvent();
}

class LoadingRtpReceivedEvent extends RtpReceivedEvent {
  final RtpReceivedListRequest rtpReceivedListRequest;

  const LoadingRtpReceivedEvent({@required this.rtpReceivedListRequest});

  @override
  List<Object> get props => [rtpReceivedListRequest];
}

class LoadedRtpReceivedEvent extends RtpReceivedEvent {
  const LoadedRtpReceivedEvent();

  @override
  List<Object> get props => [];
}
