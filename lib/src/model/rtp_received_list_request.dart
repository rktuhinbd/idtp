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
  List<CredData> credData;
  DeviceInfo deviceInf;
  int pageNumber;
  int pageSize;
  String userVid;

  factory RtpReceivedListRequest.fromJson(Map<String, dynamic> json) => RtpReceivedListRequest(
    channelId: json["channelId"],
    credData: List<CredData>.from(json["credData"].map((x) => CredData.fromJson(x))),
    deviceInf: DeviceInfo.fromJson(json["deviceInf"]),
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

class CredData {
  CredData({
    this.data,
    this.subtype,
    this.type,
  });

  String data;
  String subtype;
  String type;

  factory CredData.fromJson(Map<String, dynamic> json) => CredData(
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

class DeviceInfo {
  DeviceInfo({
    this.deviceId,
    this.ip,
    this.location,
    this.mobileNo,
  });

  String deviceId;
  String ip;
  String location;
  String mobileNo;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => DeviceInfo(
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
