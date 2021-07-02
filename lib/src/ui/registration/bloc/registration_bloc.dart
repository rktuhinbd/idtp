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

      } catch (e) {
        print(e);
      }
    }

    if(event is UserValidationEvent){
      yield LoadingRegistrationState();

      try{
        var response = await RegistrationService().validateIdtpUser(event.validateIdtpUserRequest);
        print(response);
      } catch(e){

      }
    }

  }

}
