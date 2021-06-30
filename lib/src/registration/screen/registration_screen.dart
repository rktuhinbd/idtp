import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idtp/src/registration/bloc/registration_bloc.dart';
import 'package:idtp/src/registration/bloc/registration_event.dart';
import 'package:idtp/src/registration/bloc/registration_state.dart';
import 'package:idtp/src/utils/toast.dart';
import 'package:idtp/src/utils/validator.dart';

class RegistrationScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  TextEditingController requestedVIDController = TextEditingController();
  TextEditingController idtpPinController = TextEditingController();
  TextEditingController confirmIdtpPinController = TextEditingController();

  String requestedVID;
  String idtpPin;
  String confirmIdtpPin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Register for IDTP"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              child: BlocBuilder<RegistrationBloc, SignUpState>(
                  builder: (BuildContext context, SignUpState state) {
                if (state is LoadingSignUpState) {
                  return sign_up_widget(context);
                }
                return sign_up_widget(context);
              }),
            ),
          ),
        ));
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
                  print("IDTP Pin 2: " + confirmIdtpPinController.text);

                  BlocProvider.of<RegistrationBloc>(context)
                      .add(UserSignUpEvent());

                  showToast("Validation Completed.");
                } else {
                  // showToast("Validation Incomplete!");
                }
              },
              color: Colors.blue,
              child: Text(
                'Register IDTP User',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ))
      ],
    ));
  }
}
