import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/metro_rail_payment/bloc/metro_rail_payment_bloc.dart';

import 'metro_rail_payment_screen_builder.dart';

class MetroRailPaymentScreen extends StatelessWidget {
  const MetroRailPaymentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("MRT Refill"),
        ),
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => MetroRailPaymentBloc(),
          child: MetroRailPaymentScreenBuilder(),
        ));
  }
}
