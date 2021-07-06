import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/repository/repository.dart';
import 'package:idtp/src/utils/toast.dart';

import 'create_rtp_event.dart';
import 'create_rtp_state.dart';

class CreateRTPBloc extends Bloc<CreateRTPEvent, CreateRTPState> {
  CreateRTPBloc() : super(InitCreateRTPState());

  @override
  Stream<CreateRTPState> mapEventToState(CreateRTPEvent event) async* {
    if (event is LoadingCreateRTPEvent) {
      yield LoadingCreateRTPState();
      try {
        var response = await Repository().createRTP(event.createRTPRequest);

        if (response.code == "200") {
          showToast("Request to Pay Successful");
          yield LoadedCreateRTPState();
        } else {
          yield LoadedCreateRTPState();
          showToast("Request to Pay Failure!");
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
