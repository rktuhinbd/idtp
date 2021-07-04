import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/service/registration_service.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitHomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is UserExistenceCheckEvent) {
      yield LoadingHomeState();
      try {
        var response =
            await RegistrationService().idtpUserExistenceCheck(event.mobile);
        print(response);
        if (response.requestedVirtualId == null) {
          yield IsRegistrationPossibleState(isRegistrationPossible: true);
        } else {
          yield IsRegistrationPossibleState(isRegistrationPossible: false);
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
