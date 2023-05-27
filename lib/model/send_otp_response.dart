import 'dart:convert';

SendOtpResponse otpResponseFromJson(String str) =>
    SendOtpResponse.fromJson(json.decode(str));

class SendOtpResponse {
  bool status;
  String response;
  String requestId;

  SendOtpResponse({
    required this.status,
    required this.response,
    required this.requestId,
  });

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      SendOtpResponse(
        status: json["status"],
        response: json["response"],
        requestId: json["request_id"],
      );
}
