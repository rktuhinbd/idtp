class ValidateIdtpUserResponse {
  String code;
  String message;
  String virtualID;
  String name;

  ValidateIdtpUserResponse({this.code,
  this.message, 
  this.virtualID, 
  this.name});

  ValidateIdtpUserResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    virtualID = json['virtualID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['virtualID'] = this.virtualID;
    data['name'] = this.name;
    return data;
  }
}
