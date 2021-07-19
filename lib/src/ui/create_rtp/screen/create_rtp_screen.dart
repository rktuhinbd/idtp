import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/create_rtp/bloc/create_rtp_bloc.dart';

import 'create_rtp_screen_builder.dart';

class CreateRTPScreen extends StatelessWidget {
  const CreateRTPScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Request to Pay"),
        ),
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => CreateRTPBloc(),
          child: CreateRTPScreenBuilder(),
        ));
  }
}
