import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class TransactionHistoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitTransactionHistoryState extends TransactionHistoryState {}

class LoadingTransactionHistoryState extends TransactionHistoryState {}

class LoadedTransactionHistoryState extends TransactionHistoryState {}

