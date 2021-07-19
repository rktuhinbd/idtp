import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idtp/src/model/transactions_by_user_request.dart';

abstract class TransactionHistoryEvent extends Equatable {
  const TransactionHistoryEvent();
}

class LoadingTransactionHistoryEvent extends TransactionHistoryEvent {
  final TransactionsByUserRequest transactionsByUserRequest;

  const LoadingTransactionHistoryEvent({@required this.transactionsByUserRequest});

  @override
  List<Object> get props => [transactionsByUserRequest];
}

class LoadedTransactionHistoryEvent extends TransactionHistoryEvent {
  const LoadedTransactionHistoryEvent();

  @override
  List<Object> get props => [];
}
