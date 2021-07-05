import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/home/bloc/home_bloc.dart';

import 'dashboard_screen_builder.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("IDTP Dashboard"),
        ),
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => HomeBloc(),
          child: DashboardScreenBuilder(),
        ));
  }
}
