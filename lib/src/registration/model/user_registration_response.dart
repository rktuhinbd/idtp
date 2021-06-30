class UserRegistrationResponse {
  UserRegistrationResponse({
    this.channelID,
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
    this.requestedVirtualID,
    this.deviceId,
    this.location,
    this.ip,
    this.idtpKey,
    this.callBackUrl,
  });

  String channelID;
  String entityType;
  String name;
  String addressLine1;
  String addressLine2;
  Object district;
  String postalCode;
  String mobileNumber;
  String infoEmail;
  Object typeOfOwnership;
  Object typeOfBusiness;
  Object nameOfMinistry;
  Object nameOfDivision;
  Object typeOfFinancialInstitution;
  Object swiftCode;
  Object cbAccountNumber;
  String nid;
  String tin;
  Object bin;
  String password;
  Object dateOfBirth;
  Object financialInstitution;
  String branchName;
  String routingNumber;
  String accountNumber;
  Object contactPersonName;
  Object designation;
  Object contactNumber;
  Object contactEmail;
  String idtpPin;
  String appPass;
  String requestedVirtualID;
  Object deviceId;
  Object location;
  Object ip;
  String idtpKey;
  Object callBackUrl;

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      UserRegistrationResponse(
          channelID: json["channelID"],
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
          requestedVirtualID: json["requestedVirtualID"],
          deviceId: json["deviceId"],
          location: json["location"],
          ip: json["ip"],
          idtpKey: json["idtpKey"],
          callBackUrl: json["callBackUrl"]);

  Map<String, dynamic> toJson() => {
        "channelID": channelID,
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
        "requestedVirtualID": requestedVirtualID,
        "deviceId": deviceId,
        "location": location,
        "ip": ip,
        "idtpKey": idtpKey,
        "callBackUrl": callBackUrl,
      };
}
