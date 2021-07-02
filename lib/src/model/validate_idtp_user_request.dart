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

  String channelId;
  List<CredDatum> credData;
  DeviceInf deviceInf;
  String userVid;

  factory ValidateIdtpUserRequest.fromJson(Map<String, dynamic> json) =>
      ValidateIdtpUserRequest(
        channelId: json["channelID"],
        credData: List<CredDatum>.from(
            json["credData"].map((x) => CredDatum.fromJson(x))),
        deviceInf: DeviceInf.fromJson(json["deviceInf"]),
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
