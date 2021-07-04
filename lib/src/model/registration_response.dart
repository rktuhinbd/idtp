import 'dart:convert';

RegistrationResponse registrationResponseFromJson(String str) =>
    RegistrationResponse.fromJson(json.decode(str));

String registrationResponseToJson(RegistrationResponse data) =>
    json.encode(data.toJson());

class RegistrationResponse {
  RegistrationResponse({
    this.code,
    this.message,
    this.virtualId,
    this.seqNum,
    this.status,
    this.reason,
    this.newUser,
    this.userInfoList,
  });

  String code;
  String message;
  dynamic virtualId;
  dynamic seqNum;
  dynamic status;
  dynamic reason;
  dynamic newUser;
  List<UserInfoList> userInfoList;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      RegistrationResponse(
        code: json["code"],
        message: json["message"],
        virtualId: json["virtualID"],
        seqNum: json["seqNum"],
        status: json["status"],
        reason: json["reason"],
        newUser: json["newUser"],
        userInfoList: List<UserInfoList>.from(
            json["userInfoList"].map((x) => UserInfoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "virtualID": virtualId,
        "seqNum": seqNum,
        "status": status,
        "reason": reason,
        "newUser": newUser,
        "userInfoList": List<dynamic>.from(userInfoList.map((x) => x.toJson())),
      };
}

class UserInfoList {
  UserInfoList({
    this.seqNum,
    this.fullName,
    this.addressLine1,
    this.addressLine2,
    this.email,
    this.nid,
    this.tin,
    this.dob,
    this.creationDate,
    this.fiName,
    this.branch,
    this.routingNo,
    this.accNo,
    this.mobileNo,
    this.userStatus,
    this.virtualId,
    this.reason,
  });

  String seqNum;
  dynamic fullName;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic email;
  dynamic nid;
  dynamic tin;
  dynamic dob;
  dynamic creationDate;
  dynamic fiName;
  dynamic branch;
  dynamic routingNo;
  dynamic accNo;
  dynamic mobileNo;
  String userStatus;
  String virtualId;
  dynamic reason;

  factory UserInfoList.fromJson(Map<String, dynamic> json) => UserInfoList(
        seqNum: json["seqNum"],
        fullName: json["fullName"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        email: json["email"],
        nid: json["nid"],
        tin: json["tin"],
        dob: json["dob"],
        creationDate: json["creationDate"],
        fiName: json["fiName"],
        branch: json["branch"],
        routingNo: json["routingNo"],
        accNo: json["accNo"],
        mobileNo: json["mobileNo"],
        userStatus: json["userStatus"],
        virtualId: json["virtualID"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "seqNum": seqNum,
        "fullName": fullName,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "email": email,
        "nid": nid,
        "tin": tin,
        "dob": dob,
        "creationDate": creationDate,
        "fiName": fiName,
        "branch": branch,
        "routingNo": routingNo,
        "accNo": accNo,
        "mobileNo": mobileNo,
        "userStatus": userStatus,
        "virtualID": virtualId,
        "reason": reason,
      };
}
