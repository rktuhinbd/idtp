import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idtp/src/model/create_rtp_request.dart';

abstract class CreateRTPEvent extends Equatable {
  const CreateRTPEvent();
}

class LoadingCreateRTPEvent extends CreateRTPEvent {
  final CreateRtpRequest createRTPRequest;

  const LoadingCreateRTPEvent({@required this.createRTPRequest});

  @override
  List<Object> get props => [createRTPRequest];

  @override
  String toString() {
    return 'LoadingCreateRTPEvent{CreateRTPRequest: $createRTPRequest}';
  }
}

class LoadedCreateRTPEvent extends CreateRTPEvent {
  const LoadedCreateRTPEvent();

  @override
  List<Object> get props => [];
}
