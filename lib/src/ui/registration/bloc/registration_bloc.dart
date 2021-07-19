import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/repository/repository.dart';
import 'package:idtp/src/ui/registration/bloc/registration_state.dart';
import 'package:idtp/src/utils/toast.dart';

import 'registration_event.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(InitRegistrationState());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is InitRegistrationEvent) {
      yield LoadingRegistrationState();
    }

    if (event is UserValidationEvent) {
      try {
        var response =
            await Repository().validateIdtpUser(event.validateIdtpUserRequest);
        print(response);
        if (response.code == "200") {
          yield UserRegistrationSuccessState(isValidUser: false);
          showToast(
              "This VID is already registered, please try with other VID");
        } else {
          yield UserRegistrationSuccessState(isValidUser: true);
        }
      } catch (e) {
        print(e);
      }
    }

    if (event is UserRegistrationEvent) {
      yield UserRegistrationState();

      try {
        var response =
            await Repository().registerIdtpUser(event.registrationRequest);
        print(response);
        if (response.code == "200") {
          yield UserRegistrationSuccessState();

          showToast("User registration successful");
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
