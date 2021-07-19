import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idtp/src/model/create_rtp_request.dart';
import 'package:idtp/src/model/create_rtp_response.dart';
import 'package:idtp/src/model/fund_transfer_request.dart';
import 'package:idtp/src/model/fund_transfer_response.dart';
import 'package:idtp/src/model/registration_request.dart';
import 'package:idtp/src/model/rtp_received_list_request.dart';
import 'package:idtp/src/model/rtp_received_list_response.dart';
import 'package:idtp/src/model/rtp_sent_list_request.dart';
import 'package:idtp/src/model/rtp_sent_list_response.dart';
import 'package:idtp/src/model/transactions_by_user_request.dart';
import 'package:idtp/src/model/transactions_by_user_response.dart';
import 'package:idtp/src/model/user_existence_check_response.dart';
import 'package:idtp/src/model/validate_idtp_user_request.dart';
import 'package:idtp/src/service/api_request.dart';

class Repository {
  Future<dynamic> idtpUserExistenceCheck(mobile) async {
    var finalOutput;
    var res = await ApiRequest.get("api/user/$mobile");

    print("Response=>$res");

    String data = res;

    try {
      finalOutput = userExistenceCheckResponseFromJson(data);
    } catch (e) {
      print(e);
    }
    return finalOutput;
  }

  Future<dynamic> validateIdtpUser(validateIdtpUserRequest) async {
    var finalOutput;
    var res = await ApiRequest.post("management/ValidateIDTPUser",
        validateIdtpUserRequestToJson(validateIdtpUserRequest));

    print("Response=>$res");

    String data = res;

    try {
      finalOutput = userExistenceCheckResponseFromJson(data);
    } catch (e) {
      print(e);
    }
    return finalOutput;
  }

  Future<dynamic> registerIdtpUser(registrationRequest) async {
    var finalOutput;
    var res = await ApiRequest.post("management/RegisterIDTPUser",
        registerUserRequestToJson(registrationRequest));

    print("Response=>$res");

    String data = res;

    try {
      finalOutput = userExistenceCheckResponseFromJson(data);
    } catch (e) {
      print(e);
    }
    return finalOutput;
  }

  Future<dynamic> fundTransfer(fundTransferRequest) async {
    var finalOutput;
    var res = await ApiRequest.post("financial/TransferFunds",
        fundTransferRequestToJson(fundTransferRequest));

    print("Response=>$res");

    String data = res;

    try {
      finalOutput = fundTransferResponseFromJson(data);
    } catch (e) {
      print(e);
    }
    return finalOutput;
  }

  Future<dynamic> createRTP(createRtpRequest) async {
    var finalOutput;
    var res = await ApiRequest.post(
        "financial/CreateRTP", createRtpRequestToJson(createRtpRequest));

    print("Response=>$res");

    String data = res;

    try {
      finalOutput = createRtpResponseFromJson(data);
    } catch (e) {
      print(e);
    }
    return finalOutput;
  }

  Future<dynamic> getTransactionsByUser(getTransactionsByUserRequest) async {
    var finalOutput;
    var res = await ApiRequest.post("management/GetTransactionsbyUser",
        getTransactionsByUserRequestToJson(getTransactionsByUserRequest));

    print("Response=>$res");

    String data = res;

    try {
      finalOutput = getTransactionsByUserResponseFromJson(data);
    } catch (e) {
      print(e);
    }
    return finalOutput;
  }

  Future<dynamic> getRtpSentList(rtpSentRequest) async {
    var finalOutput;
    var res = await ApiRequest.post(
        "management/GetRTPListSent", rtpSentListRequestToJson(rtpSentRequest));

    print("Response=>$res");

    String data = res;

    try {
      finalOutput = rtpSentListResponseFromJson(data);
    } catch (e) {
      print(e);
    }
    return finalOutput;
  }

  Future<dynamic> getRtpReceivedList(rtpReceivedRequest) async {
    var finalOutput;
    var res = await ApiRequest.post(
        "management/GetRTPListReceived", rtpReceivedListRequestToJson(rtpReceivedRequest));

    print("Response=>$res");

    String data = res;

    try {
      finalOutput = rtpReceivedListResponseFromJson(data);
    } catch (e) {
      print(e);
    }
    return finalOutput;
  }
}
