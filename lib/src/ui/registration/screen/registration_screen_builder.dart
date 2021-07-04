import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/registration_request.dart';
import 'package:idtp/src/model/validate_idtp_user_request.dart';
import 'package:idtp/src/ui/registration/bloc/registration_bloc.dart';
import 'package:idtp/src/ui/registration/bloc/registration_event.dart';
import 'package:idtp/src/ui/registration/bloc/registration_state.dart';
import 'package:idtp/src/utils/toast.dart';
import 'package:idtp/src/utils/validator.dart';

class RegistrationBuilderScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  TextEditingController requestedVIDController = TextEditingController();
  TextEditingController idtpPinController = TextEditingController();
  TextEditingController confirmIdtpPinController = TextEditingController();

  RegistrationRequest registrationRequest = new RegistrationRequest();
  String requestedVID;
  String idtpPin;
  String confirmIdtpPin;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is UserRegistrationState) {
            if (registrationRequest != null) {
              print("Registration api calling . . .");

              ///=== Registration api call === ///
              BlocProvider.of<RegistrationBloc>(context).add(
                  UserRegistrationEvent(
                      registrationRequest: registrationRequest));
            } else {
              showToast("Registration data missing");
            }
          }
        },
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
              child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: sign_up_widget(context)),
            )));
  }

  // ignore: non_constant_identifier_names
  Widget sign_up_widget(BuildContext context) {
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
          onSaved: (String value) {
            requestedVID = value;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              suffixText: 'example@user.idtp',
              labelText: 'Requested Virtual ID',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0)),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          obscureText: true,
          controller: idtpPinController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (value) => {idtpPin = value},
          onSaved: (String value) {
            idtpPin = value;
          },
          validator: (value) => validateIdtpPin(value, null, false),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              labelText: 'IDTP Pin',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0)),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          obscureText: true,
          controller: confirmIdtpPinController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: (value) => {confirmIdtpPin = value},
          onSaved: (String value) {
            confirmIdtpPin = value;
          },
          validator: (value) => validateIdtpPin(value, idtpPin, true),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              labelText: 'Confirm IDTP Pin',
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
                  print("Requested VID: " + requestedVIDController.text);
                  print("IDTP Pin: " + idtpPinController.text);

                  ///=== Validation data setting === ///
                  ValidateIdtpUserRequest validateIdtpUserRequest =
                      new ValidateIdtpUserRequest();

                  validateIdtpUserRequest.channelId = "Mobile";
                  validateIdtpUserRequest.userVid = requestedVIDController.text;
                  validateIdtpUserRequest.deviceInf =
                      DeviceInf1(mobileNo: "01841752600");

                  List<CredDatum> credData = [
                    CredDatum(data: idtpPinController.text, type: "IDTP_PIN")
                  ];

                  validateIdtpUserRequest.credData = credData;

                  ///=== Registration data setting === ///
                  List<CredData> credData2 = [
                    CredData(data: idtpPinController.text, type: "IDTP_PIN")
                  ];

                  registrationRequest.channelID = "Mobile";
                  registrationRequest.entityType = "Individual";
                  List<UserReqs> userReqs = [
                    UserReqs(
                        credData: credData2,
                        accountNumber: "0021130141392",
                        requestedVirtualID: requestedVIDController.text,
                        password: "12345678",
                        deviceInf: DeviceInf(mobileNo: "01841752600"))
                  ];
                  registrationRequest.userReqs = userReqs;

                  ///=== Validation api call === ///
                  BlocProvider.of<RegistrationBloc>(context).add(
                      UserValidationEvent(
                          validateIdtpUserRequest: validateIdtpUserRequest));

                  // showToast("Validation Completed.");
                } else {
                  // showToast("Validation Incomplete!");
                }
              },
              color: Colors.green,
              child: Text(
                'Register IDTP User',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ))
      ],
    ));
  }
}