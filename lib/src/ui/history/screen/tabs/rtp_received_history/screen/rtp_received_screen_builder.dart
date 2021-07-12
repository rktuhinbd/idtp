import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/rtp_received_list_request.dart';
import 'package:idtp/src/model/rtp_received_list_response.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_received_history/bloc/rtp_received_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_received_history/bloc/rtp_received_event.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_received_history/bloc/rtp_received_state.dart';
import 'package:idtp/src/ui/widget/loader.dart';

class RtpReceivedScreenBuilder extends StatefulWidget {
  const RtpReceivedScreenBuilder({Key key}) : super(key: key);

  @override
  _RtpReceivedScreenBuilderState createState() =>
      _RtpReceivedScreenBuilderState();
}

class _RtpReceivedScreenBuilderState extends State<RtpReceivedScreenBuilder> {
  RtpReceivedListRequest rtpReceivedListRequest = new RtpReceivedListRequest();
  List<Transaction> transactions = [];

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
      if (state is LoadingRtpReceivedState) {
      }
      if (state is LoadedRtpReceivedState) {
        transactions = state.transactions;
      }
    }, child: BlocBuilder<RtpReceivedBloc, RtpReceivedState>(
            builder: (context, state) {

              if (state is LoadingRtpReceivedState) {
                return Loader();
              }

      return Container(
        color: Colors.grey,
        child: ListView.builder(
            itemCount: transactions.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              transactions[index].senderVid == null
                                  ? ""
                                  : transactions[index].senderVid.toString(),
                              style: TextStyle(fontSize: 16)),
                          Text(
                              transactions[index].date == null
                                  ? ""
                                  : transactions[index]
                                      .date
                                      .toString()
                                      .split(" ")[0],
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                                transactions[index].txnId == null
                                    ? ""
                                    : transactions[index].txnId.toString(),
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                                transactions[index].amount == null
                                    ? ""
                                    : "৳" +
                                        transactions[index].amount.toString(),
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                                textAlign: TextAlign.end),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    }));
  }
}
