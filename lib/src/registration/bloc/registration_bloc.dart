import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/registration/bloc/registration_state.dart';
import 'registration_event.dart';

class RegistrationBloc extends Bloc<SignUpEvent, SignUpState>{
  RegistrationBloc() : super(InitSignUpState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {

    if(event is LoadingSignUpState){
      yield LoadingSignUpState();
      try{

      } catch(e){

      }
    }
  }

}