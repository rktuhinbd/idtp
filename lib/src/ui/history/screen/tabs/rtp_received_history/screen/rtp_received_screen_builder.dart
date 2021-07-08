import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/rtp_received_list_request.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_received_history/bloc/rtp_received_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_received_history/bloc/rtp_received_event.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_received_history/bloc/rtp_received_state.dart';

class RtpReceivedScreenBuilder extends StatefulWidget {
  const RtpReceivedScreenBuilder({Key key}) : super(key: key);

  @override
  _RtpReceivedScreenBuilderState createState() =>
      _RtpReceivedScreenBuilderState();
}

class _RtpReceivedScreenBuilderState extends State<RtpReceivedScreenBuilder> {
  @override
  void initState() {
    super.initState();
    getRtpReceivedList();
  }

  void getRtpReceivedList() {
    ///=== Transaction history data setting === ///
    List<CredDatum> credData = [
      CredDatum(data: "123456", type: "IDTP_PIN"),
    ];

    RtpReceivedListRequest rtpReceivedListRequest =
        new RtpReceivedListRequest();
    rtpReceivedListRequest.channelId = "Mobile";
    rtpReceivedListRequest.deviceInf = DeviceInf();
    rtpReceivedListRequest.credData = credData;
    rtpReceivedListRequest.pageNumber = 1;
    rtpReceivedListRequest.pageSize = 50;
    rtpReceivedListRequest.userVid = "karim@user.idtp";

    ///=== Rtp Received history api call === ///
    BlocProvider.of<RtpReceivedBloc>(context).add(LoadingRtpReceivedEvent(
        rtpReceivedListRequest: rtpReceivedListRequest));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RtpReceivedBloc, RtpReceivedState>(
        listener: (context, state) {
          if (state is LoadingRtpReceivedState) {}
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey,
        ));
  }
}
