import 'dart:convert';

CreateRtpResponse createRtpResponseFromJson(String str) =>
    CreateRtpResponse.fromJson(json.decode(str));

String createRtpResponseToJson(CreateRtpResponse data) =>
    json.encode(data.toJson());

class CreateRtpResponse {
  CreateRtpResponse({
    this.code,
    this.message,
    this.refNo,
    this.orgnlTxId,
    this.orgnlEndToEndId,
    this.msgId,
    this.reqId,
  });

  String code;
  String message;
  dynamic refNo;
  dynamic orgnlTxId;
  dynamic orgnlEndToEndId;
  dynamic msgId;
  String reqId;

  factory CreateRtpResponse.fromJson(Map<String, dynamic> json) =>
      CreateRtpResponse(
        code: json["code"],
        message: json["message"],
        refNo: json["refNo"],
        orgnlTxId: json["orgnlTxId"],
        orgnlEndToEndId: json["orgnlEndToEndId"],
        msgId: json["msgId"],
        reqId: json["reqId"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "refNo": refNo,
        "orgnlTxId": orgnlTxId,
        "orgnlEndToEndId": orgnlEndToEndId,
        "msgId": msgId,
        "reqId": reqId,
      };
}
