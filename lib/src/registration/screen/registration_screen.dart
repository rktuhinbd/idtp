import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/registration/bloc/registration_bloc.dart';
import 'package:idtp/src/registration/screen/registration_screen_builder.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Register for IDTP"),
        ),
        body: BlocProvider(
          create: (context) => RegistrationBloc(),
          child: RegistrationBuilderScreen(),
        ));
  }
}
