import 'package:idtp/src/model/fund_transfer_request.dart';
import 'package:idtp/src/model/fund_transfer_response.dart';
import 'package:idtp/src/model/registration_request.dart';
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
}
