class RegistrationResponse {
  String code;
  String message;
  String virtualID;
  String seqNum;
  String status;
  String reason;
  String newUser;
  List<UserInfoList> userInfoList;

  RegistrationResponse(
      {this.code,
      this.message,
      this.virtualID,
      this.seqNum,
      this.status,
      this.reason,
      this.newUser,
      this.userInfoList});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    virtualID = json['virtualID'];
    seqNum = json['seqNum'];
    status = json['status'];
    reason = json['reason'];
    newUser = json['newUser'];
    if (json['userInfoList'] != null) {
      userInfoList = new List<UserInfoList>();
      json['userInfoList'].forEach((v) {
        userInfoList.add(new UserInfoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['virtualID'] = this.virtualID;
    data['seqNum'] = this.seqNum;
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['newUser'] = this.newUser;
    if (this.userInfoList != null) {
      data['userInfoList'] = this.userInfoList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserInfoList {
  String seqNum;
  String fullName;
  String addressLine1;
  String addressLine2;
  String email;
  String nid;
  String tin;
  String dob;
  String creationDate;
  String fiName;
  String branch;
  String routingNo;
  String accNo;
  String mobileNo;
  String userStatus;
  String virtualID;
  String reason;

  UserInfoList(
      {this.seqNum,
      this.fullName,
      this.addressLine1,
      this.addressLine2,
      this.email,
      this.nid,
      this.tin,
      this.dob,
      this.creationDate,
      this.fiName,
      this.branch,
      this.routingNo,
      this.accNo,
      this.mobileNo,
      this.userStatus,
      this.virtualID,
      this.reason});

  UserInfoList.fromJson(Map<String, dynamic> json) {
    seqNum = json['seqNum'];
    fullName = json['fullName'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    email = json['email'];
    nid = json['nid'];
    tin = json['tin'];
    dob = json['dob'];
    creationDate = json['creationDate'];
    fiName = json['fiName'];
    branch = json['branch'];
    routingNo = json['routingNo'];
    accNo = json['accNo'];
    mobileNo = json['mobileNo'];
    userStatus = json['userStatus'];
    virtualID = json['virtualID'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seqNum'] = this.seqNum;
    data['fullName'] = this.fullName;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['email'] = this.email;
    data['nid'] = this.nid;
    data['tin'] = this.tin;
    data['dob'] = this.dob;
    data['creationDate'] = this.creationDate;
    data['fiName'] = this.fiName;
    data['branch'] = this.branch;
    data['routingNo'] = this.routingNo;
    data['accNo'] = this.accNo;
    data['mobileNo'] = this.mobileNo;
    data['userStatus'] = this.userStatus;
    data['virtualID'] = this.virtualID;
    data['reason'] = this.reason;
    return data;
  }
}
