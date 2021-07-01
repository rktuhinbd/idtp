class UserExistenceCheckResponse {
  String channelID;
  String entityType;
  String name;
  String addressLine1;
  String addressLine2;
  Null district;
  String postalCode;
  String mobileNumber;
  String infoEmail;
  Null typeOfOwnership;
  Null typeOfBusiness;
  Null nameOfMinistry;
  Null nameOfDivision;
  Null typeOfFinancialInstitution;
  Null swiftCode;
  Null cbAccountNumber;
  String nid;
  String tin;
  Null bin;
  String password;
  Null dateOfBirth;
  Null financialInstitution;
  String branchName;
  String routingNumber;
  String accountNumber;
  Null contactPersonName;
  Null designation;
  Null contactNumber;
  Null contactEmail;
  String idtpPin;
  String appPass;
  String requestedVirtualID;
  Null deviceId;
  Null location;
  Null ip;
  String idtpKey;
  Null callBackUrl;

  UserExistenceCheckResponse(
      {this.channelID,
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
      this.callBackUrl});

  UserExistenceCheckResponse.fromJson(Map<String, dynamic> json) {
    channelID = json['channelID'];
    entityType = json['entityType'];
    name = json['name'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    district = json['district'];
    postalCode = json['postalCode'];
    mobileNumber = json['mobileNumber'];
    infoEmail = json['infoEmail'];
    typeOfOwnership = json['typeOfOwnership'];
    typeOfBusiness = json['typeOfBusiness'];
    nameOfMinistry = json['nameOfMinistry'];
    nameOfDivision = json['nameOfDivision'];
    typeOfFinancialInstitution = json['typeOfFinancialInstitution'];
    swiftCode = json['swiftCode'];
    cbAccountNumber = json['cbAccountNumber'];
    nid = json['nid'];
    tin = json['tin'];
    bin = json['bin'];
    password = json['password'];
    dateOfBirth = json['dateOfBirth'];
    financialInstitution = json['financialInstitution'];
    branchName = json['branchName'];
    routingNumber = json['routingNumber'];
    accountNumber = json['accountNumber'];
    contactPersonName = json['contactPersonName'];
    designation = json['designation'];
    contactNumber = json['contactNumber'];
    contactEmail = json['contactEmail'];
    idtpPin = json['idtpPin'];
    appPass = json['appPass'];
    requestedVirtualID = json['requestedVirtualID'];
    deviceId = json['deviceId'];
    location = json['location'];
    ip = json['ip'];
    idtpKey = json['idtpKey'];
    callBackUrl = json['callBackUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelID'] = this.channelID;
    data['entityType'] = this.entityType;
    data['name'] = this.name;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['district'] = this.district;
    data['postalCode'] = this.postalCode;
    data['mobileNumber'] = this.mobileNumber;
    data['infoEmail'] = this.infoEmail;
    data['typeOfOwnership'] = this.typeOfOwnership;
    data['typeOfBusiness'] = this.typeOfBusiness;
    data['nameOfMinistry'] = this.nameOfMinistry;
    data['nameOfDivision'] = this.nameOfDivision;
    data['typeOfFinancialInstitution'] = this.typeOfFinancialInstitution;
    data['swiftCode'] = this.swiftCode;
    data['cbAccountNumber'] = this.cbAccountNumber;
    data['nid'] = this.nid;
    data['tin'] = this.tin;
    data['bin'] = this.bin;
    data['password'] = this.password;
    data['dateOfBirth'] = this.dateOfBirth;
    data['financialInstitution'] = this.financialInstitution;
    data['branchName'] = this.branchName;
    data['routingNumber'] = this.routingNumber;
    data['accountNumber'] = this.accountNumber;
    data['contactPersonName'] = this.contactPersonName;
    data['designation'] = this.designation;
    data['contactNumber'] = this.contactNumber;
    data['contactEmail'] = this.contactEmail;
    data['idtpPin'] = this.idtpPin;
    data['appPass'] = this.appPass;
    data['requestedVirtualID'] = this.requestedVirtualID;
    data['deviceId'] = this.deviceId;
    data['location'] = this.location;
    data['ip'] = this.ip;
    data['idtpKey'] = this.idtpKey;
    data['callBackUrl'] = this.callBackUrl;
    return data;
  }
}
