import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/create_rtp_request.dart';
import 'package:idtp/src/ui/create_rtp/bloc/create_rtp_bloc.dart';
import 'package:idtp/src/ui/create_rtp/bloc/create_rtp_event.dart';
import 'package:idtp/src/ui/create_rtp/bloc/create_rtp_state.dart';
import 'package:idtp/src/utils/validator.dart';
import 'package:validators/validators.dart';

class CreateRTPScreenBuilder extends StatefulWidget {
  const CreateRTPScreenBuilder({Key key}) : super(key: key);

  @override
  _CreateRTPScreenBuilderState createState() => _CreateRTPScreenBuilderState();
}

class _CreateRTPScreenBuilderState extends State<CreateRTPScreenBuilder> {
  final formKey = GlobalKey<FormState>();
  FocusNode _focusNode = new FocusNode();

  TextEditingController requestedVIDController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController idtpPinController = TextEditingController();

  CreateRtpRequest createRTPRequest = new CreateRtpRequest();

  String requestedVID;
  String amount;
  String purpose;
  String idtpPin;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateRTPBloc, CreateRTPState>(
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

                  createRTPRequest.channelId = "Mobile";
                  createRTPRequest.txnAmount = amountController.text;
                  createRTPRequest.purpose = purposeController.text;
                  createRTPRequest.senderVid =
                      "aib30008@user.idtp"; //Todo need to make is dynamic
                  createRTPRequest.receiverVid = requestedVIDController.text;
                  createRTPRequest.deviceInf = DeviceInf();
                  List<CredDatum> credData = [
                    CredDatum(data: idtpPinController.text, type: "IDTP_PIN"),
                  ];

                  createRTPRequest.credData = credData;

                  ///=== Create RTP api call === ///
                  BlocProvider.of<CreateRTPBloc>(context).add(
                      LoadingCreateRTPEvent(
                          createRTPRequest: createRTPRequest));
                }
              },
              color: Colors.green,
              child: Text(
                'Request to Pay',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ))
      ],
    ));
  }
}
