import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_sent_history/bloc/rtp_sent_bloc.dart';
import 'package:idtp/src/ui/history/screen/tabs/rtp_sent_history/screen/rtp_sent_screen_builder.dart';

class RtpSentScreen extends StatelessWidget {
  const RtpSentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RtpSentBloc(),
      child: RtpSentScreenBuilder(),
    );
  }
}
