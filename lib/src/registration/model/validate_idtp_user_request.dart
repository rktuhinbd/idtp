class ValidateIDTPUserRequest {
  String channelID;
  List<CredData> credData;
  DeviceInf deviceInf;
  String userVid;

  ValidateIDTPUserRequest(
      {this.channelID, this.credData, this.deviceInf, this.userVid});

  ValidateIDTPUserRequest.fromJson(Map<String, dynamic> json) {
    channelID = json['channelID'];
    if (json['credData'] != null) {
      credData = new List<CredData>();
      json['credData'].forEach((v) {
        credData.add(new CredData.fromJson(v));
      });
    }
    deviceInf = json['deviceInf'] != null
        ? new DeviceInf.fromJson(json['deviceInf'])
        : null;
    userVid = json['userVid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelID'] = this.channelID;
    if (this.credData != null) {
      data['credData'] = this.credData.map((v) => v.toJson()).toList();
    }
    if (this.deviceInf != null) {
      data['deviceInf'] = this.deviceInf.toJson();
    }
    data['userVid'] = this.userVid;
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
