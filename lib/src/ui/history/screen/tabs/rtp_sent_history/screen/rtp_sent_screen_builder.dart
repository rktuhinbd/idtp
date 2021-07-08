import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/rtp_sent_list_request.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_sent_history/bloc/rtp_sent_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_sent_history/bloc/rtp_sent_event.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_sent_history/bloc/rtp_sent_state.dart';

class RtpSentScreenBuilder extends StatefulWidget {
  const RtpSentScreenBuilder({Key key}) : super(key: key);

  @override
  _RtpSentScreenBuilderState createState() => _RtpSentScreenBuilderState();
}

class _RtpSentScreenBuilderState extends State<RtpSentScreenBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSentRtpList();
  }

  void getSentRtpList() {
    RtpSentListRequest rtpSentListRequest = new RtpSentListRequest();

    ///=== Transaction history data setting === ///
    List<CredDatum> credData = [
      CredDatum(data: "123456", type: "IDTP_PIN"),
    ];

    rtpSentListRequest.channelId = "Mobile";
    rtpSentListRequest.deviceInf = DeviceInf();
    rtpSentListRequest.credData = credData;
    rtpSentListRequest.pageNumber = 1;
    rtpSentListRequest.pageSize = 50;
    rtpSentListRequest.userVid = "karim@user.idtp";

    ///=== Rtp sent history api call === ///
    BlocProvider.of<RtpSentBloc>(context)
        .add(LoadingRtpSentEvent(rtpSentListRequest: rtpSentListRequest));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RtpSentBloc, RtpSentState>(
        listener: (context, state) {
          if (state is LoadingRtpSentState) {}
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade300,
        ));
  }
}