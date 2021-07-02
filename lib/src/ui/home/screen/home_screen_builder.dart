import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/home/bloc/home_bloc.dart';
import 'package:idtp/src/ui/home/bloc/home_event.dart';
import 'package:idtp/src/ui/home/bloc/home_state.dart';
import 'package:idtp/src/ui/registration/screen/registration_screen.dart';
import 'package:idtp/src/utils/toast.dart';

class HomeScreenBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String mobile = "01841752601";

    BlocProvider.of<HomeBloc>(context)
        .add(UserExistenceCheckEvent(mobile: mobile));

    return Scaffold(
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
    bool registrationFlag = false;

    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is IsRegistrationPossibleState) {
              if (state.isRegistrationPossible != null) {
                registrationFlag = state.isRegistrationPossible;
              } else {
                registrationFlag = true;
              }
            }

            return Container(
                width: double.infinity,
                height: 48,
                child: new MaterialButton(
                  onPressed: () {
                    if (registrationFlag) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                    } else {
                      showToast("Can not register");
                    }
                  },
                  color: Colors.green,
                  child: Text(
                    'Register IDTP User',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ));
          },
        ),
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
