import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/registration/bloc/registration_state.dart';
import 'registration_event.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState>{
  RegistrationBloc() : super(InitRegistrationState());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {

    if(event is LoadingRegistrationState){
      yield LoadingRegistrationState();
      try{

      } catch(e){

      }
    }
  }

}