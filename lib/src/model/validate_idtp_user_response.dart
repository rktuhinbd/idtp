import 'dart:convert';

ValidateIdtpUserResponse validateIdtpUserResponseFromJson(String str) =>
    ValidateIdtpUserResponse.fromJson(json.decode(str));

String validateIdtpUserResponseToJson(ValidateIdtpUserResponse data) =>
    json.encode(data.toJson());

class ValidateIdtpUserResponse {
  ValidateIdtpUserResponse({
    this.code,
    this.message,
    this.virtualId,
    this.name,
  });

  String code;
  String message;
  String virtualId;
  String name;

  factory ValidateIdtpUserResponse.fromJson(Map<String, dynamic> json) =>
      ValidateIdtpUserResponse(
        code: json["code"],
        message: json["message"],
        virtualId: json["virtualID"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "virtualID": virtualId,
        "name": name,
      };
}
