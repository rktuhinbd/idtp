import 'dart:convert';

ValidateIdtpUserRequest validateIdtpUserRequestFromJson(String str) =>
    ValidateIdtpUserRequest.fromJson(json.decode(str));

String validateIdtpUserRequestToJson(ValidateIdtpUserRequest data) =>
    json.encode(data.toJson());

class ValidateIdtpUserRequest {
  ValidateIdtpUserRequest({
    this.channelId,
    this.credData,
    this.deviceInf,
    this.userVid,
  });

  String channelId = "Mobile";
  List<CredDatum> credData;
  DeviceInf1 deviceInf;
  String userVid;

  factory ValidateIdtpUserRequest.fromJson(Map<String, dynamic> json) =>
      ValidateIdtpUserRequest(
        channelId: json["channelID"],
        credData: List<CredDatum>.from(
            json["credData"].map((x) => CredDatum.fromJson(x))),
        deviceInf: DeviceInf1.fromJson(json["deviceInf"]),
        userVid: json["userVid"],
      );

  Map<String, dynamic> toJson() => {
        "channelID": channelId,
        "credData": List<dynamic>.from(credData.map((x) => x.toJson())),
        "deviceInf": deviceInf.toJson(),
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

class DeviceInf1 {
  DeviceInf1({
    this.deviceId,
    this.ip,
    this.location,
    this.mobileNo,
  });

  String deviceId;
  String ip;
  String location;
  String mobileNo;

  factory DeviceInf1.fromJson(Map<String, dynamic> json) => DeviceInf1(
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
