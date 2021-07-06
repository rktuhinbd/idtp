import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/fund_transfer_request.dart';
import 'package:idtp/src/ui/fund_transfer/bloc/fund_transfer_bloc.dart';
import 'package:idtp/src/ui/fund_transfer/bloc/fund_transfer_event.dart';
import 'package:idtp/src/ui/fund_transfer/bloc/fund_transfer_state.dart';
import 'package:idtp/src/utils/validator.dart';
import 'package:validators/validators.dart';

class FundTransferScreenBuilder extends StatefulWidget {
  const FundTransferScreenBuilder({Key key}) : super(key: key);

  @override
  _FundTransferScreenBuilderState createState() =>
      _FundTransferScreenBuilderState();
}

class _FundTransferScreenBuilderState extends State<FundTransferScreenBuilder> {
  final formKey = GlobalKey<FormState>();
  FocusNode _focusNode = new FocusNode();

  TextEditingController requestedVIDController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController idtpPinController = TextEditingController();

  FundTransferRequest fundTransferRequest = new FundTransferRequest();

  String requestedVID;
  String amount;
  String purpose;
  String idtpPin;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FundTransferBloc, FundTransferState>(
        listener: (context, state) {},
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
          child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: _fund_transfer_widget(context)),
        )));
  }

  String validateVID(String value) {
    if (value.isEmpty) {
      return "Virtual ID can't be empty";
    } else if (!isEmail(value)) {
      return "Please enter valid Virtual ID";
    } else
      return null;
  }

  Widget _fund_transfer_widget(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: requestedVIDController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) => validateVID(value),
          onChanged: (value) => {requestedVID = value},
          focusNode: _focusNode,
          onSaved: (String value) {
            requestedVID = value;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              suffixText: 'example@user.idtp',
              labelText: 'Receiver Virtual ID',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0)),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: amountController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (value) => {amount = value},
          onSaved: (String value) {
            amount = value;
          },
          validator: (value) => validateAmount(value),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.money),
              labelText: 'Amount',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0)),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: purposeController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (value) => {purpose = value},
          onSaved: (String value) {
            purpose = value;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.description),
              labelText: 'Purpose',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0)),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          obscureText: true,
          controller: idtpPinController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: (value) => {idtpPin = value},
          onSaved: (String value) {
            idtpPin = value;
          },
          validator: (value) => validateIdtpPin(value, idtpPin, false),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              labelText: 'IDTP Pin',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0)),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
            width: double.infinity,
            height: 48,
            child: new MaterialButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  print("Fund Transfer Button Pressed");

                  fundTransferRequest.channelId = "Mobile";
                  fundTransferRequest.txnAmount = amountController.text;
                  fundTransferRequest.purpose = purposeController.text;
                  fundTransferRequest.senderVid =
                      "aib30008@user.idtp"; //Todo need to make is dynamic
                  fundTransferRequest.receiverVid = requestedVIDController.text;
                  fundTransferRequest.deviceInf = DeviceInf();
                  List<CredDatum> credData = [
                    CredDatum(data: idtpPinController.text, type: "IDTP_PIN"),
                  ];

                  fundTransferRequest.credData = credData;

                  ///=== Fund transfer api call === ///
                  BlocProvider.of<FundTransferBloc>(context).add(
                      LoadingFundTransferEvent(
                          fundTransferRequest: fundTransferRequest));
                }
              },
              color: Colors.green,
              child: Text(
                'Fund Transfer',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ))
      ],
    ));
  }
}
