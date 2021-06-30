import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/registration/bloc/registration_state.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitHomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadingRegistrationState) {
      yield LoadingHomeState();
      try {

      } catch (e) {

      }
    }
  }
}
