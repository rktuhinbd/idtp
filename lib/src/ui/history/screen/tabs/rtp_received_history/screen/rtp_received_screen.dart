import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_received_history/bloc/rtp_received_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_received_history/screen/rtp_received_screen_builder.dart';

class RtpReceivedScreen extends StatelessWidget {
  const RtpReceivedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RtpReceivedBloc(),
      child: RtpReceivedScreenBuilder(),
    );
  }
}
