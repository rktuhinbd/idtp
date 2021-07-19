import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/transactions_by_user_response.dart';
import 'package:idtp/src/repository/repository.dart';

import 'transaction_history_event.dart';
import 'transaction_history_state.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  TransactionHistoryBloc() : super(InitTransactionHistoryState());

  @override
  Stream<TransactionHistoryState> mapEventToState(
      TransactionHistoryEvent event) async* {
    if (event is LoadingTransactionHistoryEvent) {
      yield LoadingTransactionHistoryState();
      try {
        var response = await Repository()
            .getTransactionsByUser(event.transactionsByUserRequest);

        if (response.code == "200") {
          List<Transaction> transactions = response.transactions;
          if (transactions != null) {
            yield LoadedTransactionHistoryState(transactions: transactions);
          } else {
            yield LoadingTransactionFailedState();
          }
        }
      }catch(e){
        yield LoadingTransactionFailedState();
        print(e);
      }
    }
  }
}
