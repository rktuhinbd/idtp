import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_event.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(InitHistoryState());

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is LoadingHistoryEvent) {
      yield LoadingHistoryState();
      try {
        // var response = await RegistrationService().idtpUserExistenceCheck(event.mobile);

      } catch (e) {
        print(e);
      }
    }
  }
}
