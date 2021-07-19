import 'dart:convert';

FundTransferResponse fundTransferResponseFromJson(String str) =>
    FundTransferResponse.fromJson(json.decode(str));

String fundTransferResponseToJson(FundTransferResponse data) =>
    json.encode(data.toJson());

class FundTransferResponse {
  FundTransferResponse({
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
  dynamic reqId;

  factory FundTransferResponse.fromJson(Map<String, dynamic> json) =>
      FundTransferResponse(
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
