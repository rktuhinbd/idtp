import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/fund_transfer/bloc/fund_transfer_bloc.dart';

import 'fund_transfer_screen_builder.dart';

class FundTransferScreen extends StatelessWidget {
  const FundTransferScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Fund Transfer"),
        ),
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => FundTransferBloc(),
          child: FundTransferScreenBuilder(),
        ));
  }
}
