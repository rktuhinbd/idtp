import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/history/bloc/history_bloc.dart';
import 'package:idtp/src/ui/history/bloc/history_state.dart';

class HistoryScreenBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
      child: Container(
        child: BlocBuilder<HistoryBloc, HistoryState>(
            builder: (BuildContext context, HistoryState state) {
          return History_widget(context);
        }),
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  Widget History_widget(BuildContext context) {
    bool registrationFlag = false;

    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            return Container(
                width: double.infinity,
                height: 48,
                child: new MaterialButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text(
                    'Register IDTP User',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ));
          },
        ),
      ],
    ));
  }
}
