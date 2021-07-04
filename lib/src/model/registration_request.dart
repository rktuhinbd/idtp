import 'dart:convert';

RegistrationRequest registerUserRequestFromJson(String str) =>
    RegistrationRequest.fromJson(json.decode(str));

String registerUserRequestToJson(RegistrationRequest data) =>
    json.encode(data.toJson());

class RegistrationRequest {
  String channelID = "Mobile";
  String entityType;
  List<UserReqs> userReqs;

  RegistrationRequest({this.channelID, this.entityType, this.userReqs});

  RegistrationRequest.fromJson(Map<String, dynamic> json) {
    channelID = json['channelID'];
    entityType = json['entityType'];
    if (json['userReqs'] != null) {
      userReqs = new List<UserReqs>();
      json['userReqs'].forEach((v) {
        userReqs.add(new UserReqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelID'] = this.channelID;
    data['entityType'] = this.entityType;
    if (this.userReqs != null) {
      data['userReqs'] = this.userReqs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserReqs {
  String accountNumber;
  String addressLine1;
  String addressLine2;
  String bin;
  String branchName;
  String callBackUrl;
  String callFrom;
  String cbAccountNumber;
  String contactEmail;
  String contactNumber;
  String contactPersonName;
  List<CredData> credData;
  String dateOfBirth;
  String designation;
  DeviceInf deviceInf;
  String district;
  String financialInstitution;
  String idtpKey;
  String infoEmail;
  String name;
  String nameOfDivision;
  String nameOfMinistry;
  String nid;
  String password;
  String postalCode;
  String requestedVirtualID;
  String routingNumber;
  String swiftCode;
  String tin;
  String typeOfBusiness;
  String typeOfFinancialInstitution;
  String typeOfOwnership;

  UserReqs(
      {this.accountNumber,
      this.addressLine1,
      this.addressLine2,
      this.bin,
      this.branchName,
      this.callBackUrl,
      this.callFrom,
      this.cbAccountNumber,
      this.contactEmail,
      this.contactNumber,
      this.contactPersonName,
      this.credData,
      this.dateOfBirth,
      this.designation,
      this.deviceInf,
      this.district,
      this.financialInstitution,
      this.idtpKey,
      this.infoEmail,
      this.name,
      this.nameOfDivision,
      this.nameOfMinistry,
      this.nid,
      this.password,
      this.postalCode,
      this.requestedVirtualID,
      this.routingNumber,
      this.swiftCode,
      this.tin,
      this.typeOfBusiness,
      this.typeOfFinancialInstitution,
      this.typeOfOwnership});

  UserReqs.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    bin = json['bin'];
    branchName = json['branchName'];
    callBackUrl = json['callBackUrl'];
    callFrom = json['callFrom'];
    cbAccountNumber = json['cbAccountNumber'];
    contactEmail = json['contactEmail'];
    contactNumber = json['contactNumber'];
    contactPersonName = json['contactPersonName'];
    if (json['credData'] != null) {
      credData = new List<CredData>();
      json['credData'].forEach((v) {
        credData.add(new CredData.fromJson(v));
      });
    }
    dateOfBirth = json['dateOfBirth'];
    designation = json['designation'];
    deviceInf = json['deviceInf'] != null
        ? new DeviceInf.fromJson(json['deviceInf'])
        : null;
    district = json['district'];
    financialInstitution = json['financialInstitution'];
    idtpKey = json['idtpKey'];
    infoEmail = json['infoEmail'];
    name = json['name'];
    nameOfDivision = json['nameOfDivision'];
    nameOfMinistry = json['nameOfMinistry'];
    nid = json['nid'];
    password = json['password'];
    postalCode = json['postalCode'];
    requestedVirtualID = json['requestedVirtualID'];
    routingNumber = json['routingNumber'];
    swiftCode = json['swiftCode'];
    tin = json['tin'];
    typeOfBusiness = json['typeOfBusiness'];
    typeOfFinancialInstitution = json['typeOfFinancialInstitution'];
    typeOfOwnership = json['typeOfOwnership'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountNumber'] = this.accountNumber;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['bin'] = this.bin;
    data['branchName'] = this.branchName;
    data['callBackUrl'] = this.callBackUrl;
    data['callFrom'] = this.callFrom;
    data['cbAccountNumber'] = this.cbAccountNumber;
    data['contactEmail'] = this.contactEmail;
    data['contactNumber'] = this.contactNumber;
    data['contactPersonName'] = this.contactPersonName;
    if (this.credData != null) {
      data['credData'] = this.credData.map((v) => v.toJson()).toList();
    }
    data['dateOfBirth'] = this.dateOfBirth;
    data['designation'] = this.designation;
    if (this.deviceInf != null) {
      data['deviceInf'] = this.deviceInf.toJson();
    }
    data['district'] = this.district;
    data['financialInstitution'] = this.financialInstitution;
    data['idtpKey'] = this.idtpKey;
    data['infoEmail'] = this.infoEmail;
    data['name'] = this.name;
    data['nameOfDivision'] = this.nameOfDivision;
    data['nameOfMinistry'] = this.nameOfMinistry;
    data['nid'] = this.nid;
    data['password'] = this.password;
    data['postalCode'] = this.postalCode;
    data['requestedVirtualID'] = this.requestedVirtualID;
    data['routingNumber'] = this.routingNumber;
    data['swiftCode'] = this.swiftCode;
    data['tin'] = this.tin;
    data['typeOfBusiness'] = this.typeOfBusiness;
    data['typeOfFinancialInstitution'] = this.typeOfFinancialInstitution;
    data['typeOfOwnership'] = this.typeOfOwnership;
    return data;
  }
}

class CredData {
  String data;
  String subtype;
  String type;

  CredData({this.data, this.subtype, this.type});

  CredData.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    subtype = json['subtype'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['subtype'] = this.subtype;
    data['type'] = this.type;
    return data;
  }
}

class DeviceInf {
  String deviceID;
  String ip;
  String location;
  String mobileNo;

  DeviceInf({this.deviceID, this.ip, this.location, this.mobileNo});

  DeviceInf.fromJson(Map<String, dynamic> json) {
    deviceID = json['deviceID'];
    ip = json['ip'];
    location = json['location'];
    mobileNo = json['mobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceID'] = this.deviceID;
    data['ip'] = this.ip;
    data['location'] = this.location;
    data['mobileNo'] = this.mobileNo;
    return data;
  }
}
