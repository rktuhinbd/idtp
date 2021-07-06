import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/dashboard/bloc/dashboard_bloc.dart';
import 'package:idtp/src/ui/dashboard/bloc/dashboard_state.dart';
import 'package:idtp/src/ui/fund_transfer/screen/fund_transfer_screen.dart';

class DashboardScreenBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
      child: Container(
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (BuildContext context, DashboardState state) {
          return _dashboard_widget(context);
        }),
      ),
    ));
  }

  Widget _dashboard_widget(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: double.infinity,
            height: 48,
            child: new MaterialButton(
              onPressed: () {},
              color: Colors.green,
              child: Text(
                'Transaction Dashboard',
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FundTransferScreen()),
                );
              },
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
