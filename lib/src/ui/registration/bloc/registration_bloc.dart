import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/service/registration_service.dart';
import 'package:idtp/src/ui/registration/bloc/registration_state.dart';

import 'registration_event.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(InitRegistrationState());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is InitRegistrationEvent) {
      yield LoadingRegistrationState();
      try {
        // var data = await RegistrationService()
            // .validateIdtpUser(event.validateIdtpUserRequest);
        // print(data);
      } catch (e) {
        print(e);
      }
    }
  }
}
