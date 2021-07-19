import 'dart:convert';

FundTransferRequest fundTransferRequestFromJson(String str) =>
    FundTransferRequest.fromJson(json.decode(str));

String fundTransferRequestToJson(FundTransferRequest data) =>
    json.encode(data.toJson());

class FundTransferRequest {
  FundTransferRequest({
    this.channelId,
    this.credData,
    this.deviceInf,
    this.purpose,
    this.receiverVid,
    this.senderVid,
    this.txnAmount,
  });

  String channelId;
  List<CredDatum> credData;
  DeviceInf deviceInf;
  String purpose;
  String receiverVid;
  String senderVid;
  String txnAmount;

  factory FundTransferRequest.fromJson(Map<String, dynamic> json) =>
      FundTransferRequest(
        channelId: json["channelId"],
        credData: List<CredDatum>.from(
            json["credData"].map((x) => CredDatum.fromJson(x))),
        deviceInf: DeviceInf.fromJson(json["deviceInf"]),
        purpose: json["purpose"],
        receiverVid: json["receiverVID"],
        senderVid: json["senderVID"],
        txnAmount: json["txnAmount"],
      );

  Map<String, dynamic> toJson() => {
        "channelId": channelId,
        "credData": List<dynamic>.from(credData.map((x) => x.toJson())),
        "deviceInf": deviceInf.toJson(),
        "purpose": purpose,
        "receiverVID": receiverVid,
        "senderVID": senderVid,
        "txnAmount": txnAmount,
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
