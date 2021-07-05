import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/repository/registration_repository.dart';
import 'package:idtp/src/ui/dashboard/screen/dashboard_screen.dart';
import 'package:idtp/src/ui/registration/bloc/registration_state.dart';
import 'package:idtp/src/utils/toast.dart';

import 'registration_event.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(InitRegistrationState());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is InitRegistrationEvent) {
      yield LoadingRegistrationState();
      try {} catch (e) {
        print(e);
      }
    }

    if (event is UserValidationEvent) {
      yield LoadingRegistrationState();

      try {
        var response = await RegistrationRepository()
            .validateIdtpUser(event.validateIdtpUserRequest);
        print(response);
        if (response.code == "200") {
          showToast(
              "This VID is already registered, please try with other VID");
        } else {
          yield UserRegistrationState();
        }
      } catch (e) {}
    }

    if (event is UserRegistrationEvent) {
      yield UserRegistrationState();

      try {
        var response = await RegistrationRepository()
            .registerIdtpUser(event.registrationRequest);
        print(response);
        if (response.code == "200") {
          yield UserRegistrationSuccessState();

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => DashboardScreen()),
          // );

          showToast("User registration successful");
        }
      } catch (e) {}
    }
  }
}
