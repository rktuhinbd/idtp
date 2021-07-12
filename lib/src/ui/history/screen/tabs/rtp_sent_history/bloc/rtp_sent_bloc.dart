import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/rtp_sent_list_response.dart';
import 'package:idtp/src/repository/repository.dart';

import 'rtp_sent_event.dart';
import 'rtp_sent_state.dart';

class RtpSentBloc extends Bloc<RtpSentEvent, RtpSentState> {
  RtpSentBloc() : super(InitRtpSentState());

  @override
  Stream<RtpSentState> mapEventToState(RtpSentEvent event) async* {
    if (event is LoadingRtpSentEvent) {
      yield LoadingRtpSentState();
      try {
        var response =
            await Repository().getRtpSentList(event.rtpSentListRequest);

        if (response.code == "200") {
          List<Transaction> transactions = response.transactions;
          yield LoadedRtpSentState(transactions: transactions);
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
