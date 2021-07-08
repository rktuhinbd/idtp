import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/repository/repository.dart';

import 'rtp_received_event.dart';
import 'rtp_received_state.dart';

class RtpReceivedBloc extends Bloc<RtpReceivedEvent, RtpReceivedState> {
  RtpReceivedBloc() : super(InitRtpReceivedState());

  @override
  Stream<RtpReceivedState> mapEventToState(RtpReceivedEvent event) async* {
    if (event is LoadingRtpReceivedEvent) {
      yield LoadingRtpReceivedState();
      var response =
          await Repository().getRtpReceivedList(event.rtpReceivedListRequest);

      if (response.code == "200") {
        yield LoadedRtpReceivedState();
      } else {
        yield LoadedRtpReceivedState();
      }
    }
  }
}
