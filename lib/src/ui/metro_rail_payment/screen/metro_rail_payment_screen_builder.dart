import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/fund_transfer_request.dart';
import 'package:idtp/src/ui/metro_rail_payment/bloc/metro_rail_payment_bloc.dart';
import 'package:idtp/src/ui/metro_rail_payment/bloc/metro_rail_payment_event.dart';
import 'package:idtp/src/ui/metro_rail_payment/bloc/metro_rail_payment_state.dart';
import 'package:idtp/src/utils/validator.dart';

class MetroRailPaymentScreenBuilder extends StatefulWidget {
  const MetroRailPaymentScreenBuilder({Key key}) : super(key: key);

  @override
  _MetroRailPaymentScreenBuilderState createState() =>
      _MetroRailPaymentScreenBuilderState();
}

class _MetroRailPaymentScreenBuilderState
    extends State<MetroRailPaymentScreenBuilder> {
  final formKey = GlobalKey<FormState>();
  FocusNode _focusNode = new FocusNode();

  TextEditingController mrtAccountNumber = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController idtpPinController = TextEditingController();

  FundTransferRequest fundTransferRequest = new FundTransferRequest();

  String mrtAccountNo;
  String amount;
  String purpose;
  String idtpPin;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MetroRailPaymentBloc, MetroRailPaymentState>(
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
          controller: mrtAccountNumber,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) => validateVID(value),
          onChanged: (value) => {mrtAccountNo = value},
          focusNode: _focusNode,
          onSaved: (String value) {
            mrtAccountNo = value;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              labelText: 'MRT Account No',
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
                  fundTransferRequest.channelId = "Mobile";
                  fundTransferRequest.txnAmount = amountController.text;
                  fundTransferRequest.purpose = "MRT";
                  fundTransferRequest.senderVid =
                      "aib30008@user.idtp"; //Todo need to make is dynamic
                  fundTransferRequest.receiverVid = mrtAccountNumber.text;
                  fundTransferRequest.deviceInf = DeviceInf();
                  List<CredDatum> credData = [
                    CredDatum(data: idtpPinController.text, type: "IDTP_PIN"),
                  ];

                  fundTransferRequest.credData = credData;

                  ///=== Mrt refill api call === ///
                  BlocProvider.of<MetroRailPaymentBloc>(context).add(
                      LoadingMetroRailPaymentEvent(
                          fundTransferRequest: fundTransferRequest));
                }
              },
              color: Colors.green,
              child: Text(
                'MRT Refill',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ))
      ],
    ));
  }
}
