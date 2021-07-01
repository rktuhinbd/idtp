import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/registration/bloc/registration_state.dart';
import 'package:idtp/src/registration/service/registration_repository.dart';
import 'package:idtp/src/registration/service/registration_service.dart';
import 'registration_event.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(InitRegistrationState());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {

    if (event is InitRegistrationEvent) {
      yield UserExistenceCheckState();
      try {} catch (e) {}
    }

    if (event is UserExistenceCheckerEvent) {
      yield UserExistenceCheckState();
      try {
        try {
          var data = await RegistrationService().idtpUserExistenceCheck(event.mobile);
        } catch (e) {}
      } catch (e) {}
    }
  }
}
