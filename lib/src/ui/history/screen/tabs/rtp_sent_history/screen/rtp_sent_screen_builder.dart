import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/rtp_sent_list_request.dart';
import 'package:idtp/src/model/rtp_sent_list_response.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_sent_history/bloc/rtp_sent_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_sent_history/bloc/rtp_sent_event.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_sent_history/bloc/rtp_sent_state.dart';
import 'package:idtp/src/ui/widget/loader.dart';

class RtpSentScreenBuilder extends StatefulWidget {
  const RtpSentScreenBuilder({Key key}) : super(key: key);

  @override
  _RtpSentScreenBuilderState createState() => _RtpSentScreenBuilderState();
}

class _RtpSentScreenBuilderState extends State<RtpSentScreenBuilder> {

  RtpSentListRequest rtpSentListRequest = new RtpSentListRequest();
  List<Transaction> transactions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSentRtpList();
  }

  void getSentRtpList() async {

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
          if (state is LoadedRtpSentState) {
            transactions = state.transactions;
          }
        }, child: BlocBuilder<RtpSentBloc, RtpSentState>(
        builder: (context, state) {

          if (state is LoadingRtpSentState) {
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
                                  transactions[index].receiverVid == null
                                      ? ""
                                      : transactions[index].receiverVid.toString(),
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
