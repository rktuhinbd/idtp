import 'package:flutter/material.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_received_history/screen/rtp_received_screen.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_sent_history/screen/rtp_sent_screen.dart';
import 'package:idtp/src/ui/history/screen/tabs/transaction_history/screen/transaction_history_screen.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Transaction History"),
              bottom: TabBar(
                tabs: [
                  Tab(text: "Fund Transfer"),
                  Tab(text: "Received RTP"),
                  Tab(text: "Sent RTP")
                ],
              ),
            ),
            body: TabBarView(children: [
              TransactionHistoryScreen(),
              RtpReceivedScreen(),
              RtpSentScreen(),
            ])),
        length: 3,
        initialIndex: 0);
  }
}
