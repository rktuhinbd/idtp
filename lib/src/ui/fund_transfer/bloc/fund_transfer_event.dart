import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idtp/src/model/fund_transfer_request.dart';

abstract class FundTransferEvent extends Equatable {
  const FundTransferEvent();
}

class LoadingFundTransferEvent extends FundTransferEvent {
  final FundTransferRequest fundTransferRequest;

  const LoadingFundTransferEvent({@required this.fundTransferRequest});

  @override
  List<Object> get props => [fundTransferRequest];

  @override
  String toString() {
    return 'LoadingFundTransferEvent{fundTransferRequest: $fundTransferRequest}';
  }
}

class LoadedFundTransferEvent extends FundTransferEvent {
  const LoadedFundTransferEvent();

  @override
  List<Object> get props => [];
}
