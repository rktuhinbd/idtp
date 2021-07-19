import 'dart:convert';

RtpReceivedListResponse rtpReceivedListResponseFromJson(String str) => RtpReceivedListResponse.fromJson(json.decode(str));

String rtpReceivedListResponseToJson(RtpReceivedListResponse data) => json.encode(data.toJson());

class RtpReceivedListResponse {
  RtpReceivedListResponse({
    this.code,
    this.message,
    this.transactions,
  });

  String code;
  String message;
  List<Transaction> transactions;

  factory RtpReceivedListResponse.fromJson(Map<String, dynamic> json) => RtpReceivedListResponse(
    code: json["code"],
    message: json["message"],
    transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
  };
}

class Transaction {
  Transaction({
    this.seqNum,
    this.date,
    this.senderVid,
    this.senderFi,
    this.senderAcc,
    this.receiverVid,
    this.receiverFi,
    this.receiverAcc,
    this.txnId,
    this.amount,
    this.txnType,
    this.purpose,
    this.settled,
    this.txnStatus,
    this.sendingBankRefNo,
    this.sendingPspRefNo,
    this.receivingBankReference,
    this.receivingPspReference,
    this.idtpReference,
  });

  String seqNum;
  DateTime date;
  String senderVid;
  dynamic senderFi;
  String senderAcc;
  dynamic receiverVid;
  dynamic receiverFi;
  dynamic receiverAcc;
  String txnId;
  String amount;
  String txnType;
  String purpose;
  dynamic settled;
  dynamic txnStatus;
  dynamic sendingBankRefNo;
  dynamic sendingPspRefNo;
  dynamic receivingBankReference;
  dynamic receivingPspReference;
  dynamic idtpReference;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    seqNum: json["seqNum"],
    date: DateTime.parse(json["date"]),
    senderVid: json["senderVID"],
    senderFi: json["senderFI"],
    senderAcc: json["senderAcc"],
    receiverVid: json["receiverVID"],
    receiverFi: json["receiverFI"],
    receiverAcc: json["receiverAcc"],
    txnId: json["txnID"],
    amount: json["amount"],
    txnType: json["txnType"],
    purpose: json["purpose"],
    settled: json["settled"],
    txnStatus: json["txnStatus"],
    sendingBankRefNo: json["sendingBankRefNo"],
    sendingPspRefNo: json["sendingPSPRefNo"],
    receivingBankReference: json["receivingBankReference"],
    receivingPspReference: json["receivingPSPReference"],
    idtpReference: json["idtpReference"],
  );

  Map<String, dynamic> toJson() => {
    "seqNum": seqNum,
    "date": date.toIso8601String(),
    "senderVID": senderVid,
    "senderFI": senderFi,
    "senderAcc": senderAcc,
    "receiverVID": receiverVid,
    "receiverFI": receiverFi,
    "receiverAcc": receiverAcc,
    "txnID": txnId,
    "amount": amount,
    "txnType": txnType,
    "purpose": purpose,
    "settled": settled,
    "txnStatus": txnStatus,
    "sendingBankRefNo": sendingBankRefNo,
    "sendingPSPRefNo": sendingPspRefNo,
    "receivingBankReference": receivingBankReference,
    "receivingPSPReference": receivingPspReference,
    "idtpReference": idtpReference,
  };
}
