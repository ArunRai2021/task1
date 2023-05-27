import 'dart:convert';

ProfileSubmitResponse profileSubmitResponseFromJson(String str) =>
    ProfileSubmitResponse.fromJson(json.decode(str));

class ProfileSubmitResponse {
  bool status;
  String response;

  ProfileSubmitResponse({
    required this.status,
    required this.response,
  });

  factory ProfileSubmitResponse.fromJson(Map<String, dynamic> json) =>
      ProfileSubmitResponse(
        status: json["status"]??false,
        response: json["response"],
      );
}
