import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/transaction_history/bloc/transaction_history_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/transaction_history/screen/transaction_history_screen_builder.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionHistoryBloc(),
      child: TransactionHistoryScreenBuilder(),
    );
  }
}
