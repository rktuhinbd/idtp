import 'dart:convert';

RtpReceivedListRequest rtpReceivedListRequestFromJson(String str) => RtpReceivedListRequest.fromJson(json.decode(str));

String rtpReceivedListRequestToJson(RtpReceivedListRequest data) => json.encode(data.toJson());

class RtpReceivedListRequest {
  RtpReceivedListRequest({
    this.channelId,
    this.credData,
    this.deviceInf,
    this.pageNumber,
    this.pageSize,
    this.userVid,
  });

  String channelId;
  List<CredDatum> credData;
  DeviceInf deviceInf;
  int pageNumber;
  int pageSize;
  String userVid;

  factory RtpReceivedListRequest.fromJson(Map<String, dynamic> json) => RtpReceivedListRequest(
    channelId: json["channelId"],
    credData: List<CredDatum>.from(json["credData"].map((x) => CredDatum.fromJson(x))),
    deviceInf: DeviceInf.fromJson(json["deviceInf"]),
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    userVid: json["userVid"],
  );

  Map<String, dynamic> toJson() => {
    "channelId": channelId,
    "credData": List<dynamic>.from(credData.map((x) => x.toJson())),
    "deviceInf": deviceInf.toJson(),
    "pageNumber": pageNumber,
    "pageSize": pageSize,
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
