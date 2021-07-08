// To parse this JSON data, do
//
//     final getTransactionsByUserRequest = getTransactionsByUserRequestFromJson(jsonString);

import 'dart:convert';

TransactionsByUserRequest getTransactionsByUserRequestFromJson(String str) => TransactionsByUserRequest.fromJson(json.decode(str));

String getTransactionsByUserRequestToJson(TransactionsByUserRequest data) => json.encode(data.toJson());

class TransactionsByUserRequest {
  TransactionsByUserRequest({
    this.channel,
    this.credData,
    this.deviceInf,
    this.fromDate,
    this.pageNo,
    this.pageSize,
    this.toDate,
    this.userVid,
  });

  String channel;
  List<CredDatum> credData;
  DeviceInf deviceInf;
  String fromDate;
  String pageNo;
  String pageSize;
  String toDate;
  String userVid;

  factory TransactionsByUserRequest.fromJson(Map<String, dynamic> json) => TransactionsByUserRequest(
    channel: json["channel"],
    credData: List<CredDatum>.from(json["credData"].map((x) => CredDatum.fromJson(x))),
    deviceInf: DeviceInf.fromJson(json["deviceInf"]),
    fromDate: json["fromDate"],
    pageNo: json["pageNo"],
    pageSize: json["pageSize"],
    toDate: json["toDate"],
    userVid: json["userVid"],
  );

  Map<String, dynamic> toJson() => {
    "channel": channel,
    "credData": List<dynamic>.from(credData.map((x) => x.toJson())),
    "deviceInf": deviceInf.toJson(),
    "fromDate": fromDate,
    "pageNo": pageNo,
    "pageSize": pageSize,
    "toDate": toDate,
    "userVid": userVid,
  };
}

class CredDatum {
  CredDatum({
    this.data,
    this.subtype,
    this.type,
  });

  String data;
  String subtype;
  String type;

  factory CredDatum.fromJson(Map<String, dynamic> json) => CredDatum(
    data: json["data"],
    subtype: json["subtype"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "subtype": subtype,
    "type": type,
  };
}

class DeviceInf {
  DeviceInf({
    this.deviceId,
    this.ip,
    this.location,
    this.mobileNo,
  });

  String deviceId;
  String ip;
  String location;
  String mobileNo;

  factory DeviceInf.fromJson(Map<String, dynamic> json) => DeviceInf(
    deviceId: json["deviceID"],
    ip: json["ip"],
    location: json["location"],
    mobileNo: json["mobileNo"],
  );

  Map<String, dynamic> toJson() => {
    "deviceID": deviceId,
    "ip": ip,
    "location": location,
    "mobileNo": mobileNo,
  };
}
