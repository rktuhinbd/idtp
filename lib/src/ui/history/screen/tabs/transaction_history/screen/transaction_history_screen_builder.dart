import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/transactions_by_user_request.dart';
import 'package:idtp/src/model/transactions_by_user_response.dart';
import 'package:idtp/src/ui/history/screen/tabs/transaction_history/bloc/transaction_history_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/transaction_history/bloc/transaction_history_event.dart';
import 'package:idtp/src/ui/history/screen/tabs/transaction_history/bloc/transaction_history_state.dart';
import 'package:idtp/src/ui/widget/loader.dart';

class TransactionHistoryScreenBuilder extends StatefulWidget {
  const TransactionHistoryScreenBuilder({Key key}) : super(key: key);

  @override
  _TransactionHistoryScreenBuilderState createState() =>
      _TransactionHistoryScreenBuilderState();
}

class _TransactionHistoryScreenBuilderState
    extends State<TransactionHistoryScreenBuilder> {
  TransactionsByUserRequest transactionsByUserRequest =
      new TransactionsByUserRequest();

  TransactionsByUserResponse transactionsByUserResponse =
      new TransactionsByUserResponse();

  List<Transaction> transactions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTransactionHistory();
  }

  void getTransactionHistory() async {
    ///=== Transaction history data setting === ///
    List<CredDatum> credData = [
      CredDatum(data: "123456", type: "IDTP_PIN"),
    ];

    transactionsByUserRequest.channel = "Mobile";
    transactionsByUserRequest.deviceInf = DeviceInf();
    transactionsByUserRequest.credData = credData;
    transactionsByUserRequest.fromDate = "2021-07-01";
    transactionsByUserRequest.toDate = "2021-07-14";
    transactionsByUserRequest.pageNo = "1";
    transactionsByUserRequest.pageSize = "20";
    transactionsByUserRequest.userVid = "aib30008@user.idtp";

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
      if (state is LoadedTransactionHistoryState) {
        transactions = state.transactions;
      }
    }, child: BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
            builder: (context, state) {
      if (state is LoadingTransactionHistoryState) {
        return Loader();
      }

      if (state is LoadingTransactionFailedState) {
        return Center(
            child: Text(
          "No data found!",
          style: TextStyle(fontSize: 18, color: Colors.red),
        ));
      }

      return Container(
        color: Colors.grey,
        child: ListView.builder(
            itemCount: transactions.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              transactions[index].senderVid == null
                                  ? ""
                                  : transactions[index].senderVid.toString(),
                              style: TextStyle(fontSize: 16)),
                          Text(
                              transactions[index].date == null
                                  ? ""
                                  : transactions[index]
                                      .date
                                      .toString()
                                      .split(" ")[0],
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                                transactions[index].txnId == null
                                    ? ""
                                    : transactions[index].txnId.toString(),
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                                transactions[index].amount == null
                                    ? ""
                                    : "৳" +
                                        transactions[index].amount.toString(),
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                                textAlign: TextAlign.end),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    }));
  }
}
