import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idtp/src/model/fund_transfer_request.dart';

abstract class MetroRailPaymentEvent extends Equatable {
  const MetroRailPaymentEvent();
}

class LoadingMetroRailPaymentEvent extends MetroRailPaymentEvent {
  final FundTransferRequest fundTransferRequest;

  const LoadingMetroRailPaymentEvent({@required this.fundTransferRequest});

  @override
  List<Object> get props => [fundTransferRequest];

  @override
  String toString() {
    return 'LoadingMetroRailPaymentEvent{fundTransferRequest: $fundTransferRequest}';
  }
}

class LoadedMetroRailPaymentEvent extends MetroRailPaymentEvent {
  const LoadedMetroRailPaymentEvent();

  @override
  List<Object> get props => [];
}
