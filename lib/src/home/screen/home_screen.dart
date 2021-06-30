import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/home/bloc/home_bloc.dart';
import 'package:idtp/src/home/bloc/home_state.dart';
import 'package:idtp/src/registration/screen/registration_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("IDTP Home"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
          child: Container(
            child: BlocBuilder<HomeBloc, HomeState>(
                builder: (BuildContext context, HomeState state) {
              return home_widget(context);
            }),
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  Widget home_widget(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: double.infinity,
            height: 48,
            child: new MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
              color: Colors.green,
              child: Text(
                'Register IDTP User',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )),
        SizedBox(
          height: 16,
        ),
        Container(
            width: double.infinity,
            height: 48,
            child: new MaterialButton(
              onPressed: () {},
              color: Colors.green,
              child: Text(
                'Transaction History',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )),
        SizedBox(
          height: 16,
        ),
        Container(
            width: double.infinity,
            height: 48,
            child: new MaterialButton(
              onPressed: () {},
              color: Colors.green,
              child: Text(
                'Fund Transfer',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )),
        SizedBox(
          height: 16,
        ),
        Container(
            width: double.infinity,
            height: 48,
            child: new MaterialButton(
              onPressed: () {},
              color: Colors.green,
              child: Text(
                'Request to Pay',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ))
      ],
    ));
  }
}
