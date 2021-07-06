import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class FundTransferState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitFundTransferState extends FundTransferState {}

class LoadingFundTransferState extends FundTransferState {}

class LoadedFundTransferState extends FundTransferState {
}

