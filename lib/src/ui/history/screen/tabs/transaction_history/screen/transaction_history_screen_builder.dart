import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/transactions_by_user_request.dart';
import 'package:idtp/src/ui/history/screen/tabs/transaction_history/bloc/transaction_history_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/transaction_history/bloc/transaction_history_event.dart';
import 'package:idtp/src/ui/history/screen/tabs/transaction_history/bloc/transaction_history_state.dart';

class TransactionHistoryScreenBuilder extends StatefulWidget {
  const TransactionHistoryScreenBuilder({Key key}) : super(key: key);

  @override
  _TransactionHistoryScreenBuilderState createState() =>
      _TransactionHistoryScreenBuilderState();
}

class _TransactionHistoryScreenBuilderState
    extends State<TransactionHistoryScreenBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTransactionHistory();
  }

  void getTransactionHistory() {
    TransactionsByUserRequest transactionsByUserRequest =
        new TransactionsByUserRequest();

    ///=== Transaction history data setting === ///
    List<CredDatum> credData = [
      CredDatum(data: "123456", type: "IDTP_PIN"),
    ];

    transactionsByUserRequest.channel = "Mobile";
    transactionsByUserRequest.deviceInf = DeviceInf();
    transactionsByUserRequest.credData = credData;
    transactionsByUserRequest.fromDate = "2020-07-01";
    transactionsByUserRequest.toDate = "2020-07-07";
    transactionsByUserRequest.pageNo = "1";
    transactionsByUserRequest.pageSize = "100";
    transactionsByUserRequest.userVid = "karim@user.idtp";

    ///=== Rtp sent history api call === ///
    BlocProvider.of<TransactionHistoryBloc>(context).add(
        LoadingTransactionHistoryEvent(
            transactionsByUserRequest: transactionsByUserRequest));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionHistoryBloc, TransactionHistoryState>(
        listener: (context, state) {
          if (state is LoadingTransactionHistoryState) {}
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        ));
  }
}
