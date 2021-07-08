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

class _TransactionHistoryScreenBuilderState extends State<TransactionHistoryScreenBuilder> {

  TransactionsByUserRequest getTransactionsByUserRequest =
  new TransactionsByUserRequest();

  ///=== Transaction history data setting === ///
  List<CredDatum> credData = [
    CredDatum(data: "123456", type: "IDTP_PIN"),
  ];

  @override
  Widget build(BuildContext context) {

    getTransactionsByUserRequest.channel = "Mobile";
    getTransactionsByUserRequest.deviceInf = DeviceInf();
    getTransactionsByUserRequest.credData = credData;
    getTransactionsByUserRequest.fromDate = "2020-07-01";
    getTransactionsByUserRequest.toDate = "2020-07-07";
    getTransactionsByUserRequest.pageNo = "1";
    getTransactionsByUserRequest.pageSize = "100";
    getTransactionsByUserRequest.userVid = "karim@user.idtp";

    return BlocListener<TransactionHistoryBloc, TransactionHistoryState>(
        listener: (context, state) {
          if (state is LoadingTransactionHistoryState) {
            if (getTransactionsByUserRequest != null) {
              ///=== Transaction history api call === ///
              BlocProvider.of<TransactionHistoryBloc>(context).add(
                  LoadingTransactionHistoryEvent(
                      getTransactionsByUserRequest:
                          getTransactionsByUserRequest));
            }
          }
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        ));
  }
}
