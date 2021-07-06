import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/model/registration_request.dart';
import 'package:idtp/src/model/validate_idtp_user_request.dart';
import 'package:idtp/src/ui/registration/bloc/registration_bloc.dart';
import 'package:idtp/src/ui/registration/bloc/registration_event.dart';
import 'package:idtp/src/ui/registration/bloc/registration_state.dart';
import 'package:idtp/src/utils/my_alert_dialog.dart';
import 'package:idtp/src/utils/validator.dart';
import 'package:validators/validators.dart';

class RegistrationBuilderScreen extends StatefulWidget {
  @override
  _RegistrationBuilderScreenState createState() =>
      _RegistrationBuilderScreenState();
}

class _RegistrationBuilderScreenState extends State<RegistrationBuilderScreen> {
  final formKey = GlobalKey<FormState>();
  FocusNode _focusNode = new FocusNode();

  TextEditingController requestedVIDController = TextEditingController();
  TextEditingController idtpPinController = TextEditingController();
  TextEditingController confirmIdtpPinController = TextEditingController();

  RegistrationRequest registrationRequest = new RegistrationRequest();
  String requestedVID;
  String idtpPin;
  String confirmIdtpPin;
  bool isValidUser = true;

  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        final FormState form = formKey.currentState;
        if (form.validate()) {
          print('Form is valid');
        } else {
          print('Form is invalid');
        }

        if (requestedVIDController.text.isNotEmpty) {
          ///=== Validation data setting === ///
          ValidateIdtpUserRequest validateIdtpUserRequest =
              new ValidateIdtpUserRequest();

          validateIdtpUserRequest.channelId = "Mobile";
          validateIdtpUserRequest.userVid = requestedVIDController.text;
          validateIdtpUserRequest.deviceInf = DeviceInf1();
          List<CredDatum> credData = [];

          validateIdtpUserRequest.credData = credData;

          ///=== Validation api call === ///
          BlocProvider.of<RegistrationBloc>(context).add(UserValidationEvent(
              validateIdtpUserRequest: validateIdtpUserRequest));
        }
      }
    });

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
              myAlertDialog("Registration data missing", context);
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

  String validateVID(String value) {
    if (value.isEmpty) {
      return "Virtual ID can't be empty";
    } else if (!isEmail(value)) {
      return "Please enter valid Virtual ID";
    } else if (!isValidUser) {
      return "User Already Exists";
    } else
      return null;
  }

  Widget sign_up_widget(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
          if (state is UserRegistrationSuccessState) {
            if (state.isValidUser != null) {
              this.isValidUser = state.isValidUser;
            } else {
              this.isValidUser = true;
            }
          }

          return TextFormField(
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
                labelText: 'Requested Virtual ID',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0)),
          );
        }),
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
                  ///=== Registration data setting === ///
                  List<CredData> credData2 = [
                    CredData(data: idtpPinController.text, type: "IDTP_PIN"),
                    CredData(data: "Test123@", type: "APP_PASS")
                  ];

                  registrationRequest.channelID = "Mobile";
                  registrationRequest.entityType = "Individual";
                  List<UserReqs> userReqs = [
                    UserReqs(
                        credData: credData2,
                        accountNumber: "0031020007984",
                        //Todo need to make it dynamic
                        callFrom: "FIApp",
                        infoEmail: "safihoacc@gmail.com",
                        //Todo need to make it dynamic
                        requestedVirtualID: requestedVIDController.text,
                        password: "Alar@321",
                        deviceInf: DeviceInf(mobileNo: "01711821618"))
                    //Todo need to make it dynamic
                  ];
                  registrationRequest.userReqs = userReqs;
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
