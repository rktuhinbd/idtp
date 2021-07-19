import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idtp/src/model/transactions_by_user_response.dart';

@immutable
abstract class TransactionHistoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitTransactionHistoryState extends TransactionHistoryState {}

class LoadingTransactionHistoryState extends TransactionHistoryState {}

class LoadingTransactionFailedState extends TransactionHistoryState {}

class LoadedTransactionHistoryState extends TransactionHistoryState {
  final List<Transaction> transactions;
  LoadedTransactionHistoryState({this.transactions});

  @override
  List<Object> get props => [transactions];
}
