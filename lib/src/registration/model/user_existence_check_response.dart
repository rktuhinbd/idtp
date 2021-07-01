import 'dart:convert';

UserExistenceCheckResponse userExistenceCheckResponseFromJson(String str) =>
    UserExistenceCheckResponse.fromJson(json.decode(str));

String userExistenceCheckResponseToJson(UserExistenceCheckResponse data) =>
    json.encode(data.toJson());

class UserExistenceCheckResponse {
  UserExistenceCheckResponse({
    this.channelId,
    this.entityType,
    this.name,
    this.addressLine1,
    this.addressLine2,
    this.district,
    this.postalCode,
    this.mobileNumber,
    this.infoEmail,
    this.typeOfOwnership,
    this.typeOfBusiness,
    this.nameOfMinistry,
    this.nameOfDivision,
    this.typeOfFinancialInstitution,
    this.swiftCode,
    this.cbAccountNumber,
    this.nid,
    this.tin,
    this.bin,
    this.password,
    this.dateOfBirth,
    this.financialInstitution,
    this.branchName,
    this.routingNumber,
    this.accountNumber,
    this.contactPersonName,
    this.designation,
    this.contactNumber,
    this.contactEmail,
    this.idtpPin,
    this.appPass,
    this.requestedVirtualId,
    this.deviceId,
    this.location,
    this.ip,
    this.idtpKey,
    this.callBackUrl,
  });

  String channelId;
  String entityType;
  String name;
  String addressLine1;
  String addressLine2;
  dynamic district;
  String postalCode;
  String mobileNumber;
  String infoEmail;
  dynamic typeOfOwnership;
  dynamic typeOfBusiness;
  dynamic nameOfMinistry;
  dynamic nameOfDivision;
  dynamic typeOfFinancialInstitution;
  dynamic swiftCode;
  dynamic cbAccountNumber;
  String nid;
  String tin;
  dynamic bin;
  String password;
  dynamic dateOfBirth;
  dynamic financialInstitution;
  String branchName;
  String routingNumber;
  String accountNumber;
  dynamic contactPersonName;
  dynamic designation;
  dynamic contactNumber;
  dynamic contactEmail;
  String idtpPin;
  String appPass;
  String requestedVirtualId;
  dynamic deviceId;
  dynamic location;
  dynamic ip;
  String idtpKey;
  dynamic callBackUrl;

  factory UserExistenceCheckResponse.fromJson(Map<String, dynamic> json) =>
      UserExistenceCheckResponse(
        channelId: json["channelID"],
        entityType: json["entityType"],
        name: json["name"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        district: json["district"],
        postalCode: json["postalCode"],
        mobileNumber: json["mobileNumber"],
        infoEmail: json["infoEmail"],
        typeOfOwnership: json["typeOfOwnership"],
        typeOfBusiness: json["typeOfBusiness"],
        nameOfMinistry: json["nameOfMinistry"],
        nameOfDivision: json["nameOfDivision"],
        typeOfFinancialInstitution: json["typeOfFinancialInstitution"],
        swiftCode: json["swiftCode"],
        cbAccountNumber: json["cbAccountNumber"],
        nid: json["nid"],
        tin: json["tin"],
        bin: json["bin"],
        password: json["password"],
        dateOfBirth: json["dateOfBirth"],
        financialInstitution: json["financialInstitution"],
        branchName: json["branchName"],
        routingNumber: json["routingNumber"],
        accountNumber: json["accountNumber"],
        contactPersonName: json["contactPersonName"],
        designation: json["designation"],
        contactNumber: json["contactNumber"],
        contactEmail: json["contactEmail"],
        idtpPin: json["idtpPin"],
        appPass: json["appPass"],
        requestedVirtualId: json["requestedVirtualID"],
        deviceId: json["deviceId"],
        location: json["location"],
        ip: json["ip"],
        idtpKey: json["idtpKey"],
        callBackUrl: json["callBackUrl"],
      );

  Map<String, dynamic> toJson() => {
        "channelID": channelId,
        "entityType": entityType,
        "name": name,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "district": district,
        "postalCode": postalCode,
        "mobileNumber": mobileNumber,
        "infoEmail": infoEmail,
        "typeOfOwnership": typeOfOwnership,
        "typeOfBusiness": typeOfBusiness,
        "nameOfMinistry": nameOfMinistry,
        "nameOfDivision": nameOfDivision,
        "typeOfFinancialInstitution": typeOfFinancialInstitution,
        "swiftCode": swiftCode,
        "cbAccountNumber": cbAccountNumber,
        "nid": nid,
        "tin": tin,
        "bin": bin,
        "password": password,
        "dateOfBirth": dateOfBirth,
        "financialInstitution": financialInstitution,
        "branchName": branchName,
        "routingNumber": routingNumber,
        "accountNumber": accountNumber,
        "contactPersonName": contactPersonName,
        "designation": designation,
        "contactNumber": contactNumber,
        "contactEmail": contactEmail,
        "idtpPin": idtpPin,
        "appPass": appPass,
        "requestedVirtualID": requestedVirtualId,
        "deviceId": deviceId,
        "location": location,
        "ip": ip,
        "idtpKey": idtpKey,
        "callBackUrl": callBackUrl,
      };
}
