import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromJson(String str) =>
    VerifyOtpResponse.fromJson(json.decode(str));

class VerifyOtpResponse {
  bool status;
  bool profileExists;
  String jwt;

  VerifyOtpResponse({
    required this.status,
    required this.profileExists,
    required this.jwt,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponse(
        status: json["status"],
        profileExists: json["profile_exists"] ?? false,
        jwt: json["jwt"]??'',
      );
}
