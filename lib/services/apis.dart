import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_1/model/profile_submit_response.dart';
import 'package:task_1/model/send_otp_response.dart';
import 'package:task_1/model/verify_otp_response.dart';
import 'package:task_1/services/local_storage.dart';

String? requestId;

class Apis {
  final LocalStorage localStorage = LocalStorage();

  Future<bool> getOtp(String mobileNo) async {
    try {
      const url = "https://test-otp-api.7474224.xyz/sendotp.php";
      final body = {"mobile": mobileNo};
      final encodedBody = json.encode(body);
      final response = await http.post(Uri.parse(url), body: encodedBody);
      if (response.statusCode == 200) {
        SendOtpResponse otpResponse = otpResponseFromJson(response.body);
        requestId = otpResponse.requestId;
        debugPrint(
            'sdkbsadbbbk${otpResponse.response}-----${otpResponse.status}');
        return otpResponse.status;
      } else {
        debugPrint('Error: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<VerifyOtpResponse?> verifyOtp(String code) async {
    const url = "https://test-otp-api.7474224.xyz/verifyotp.php";
    final body = {
      "request_id": requestId,
      "code": code,
    };
    final encodedBody = json.encode(body);
    final response = await http.post(Uri.parse(url), body: encodedBody);
    debugPrint("${response.statusCode}**88******${response.body}");
    if (response.statusCode == 200) {
      final VerifyOtpResponse responseData =
          verifyOtpResponseFromJson(response.body);
      debugPrint(
          'sdkbsadbbbk${responseData.jwt}-----${responseData.status}----${responseData.profileExists}');
      localStorage.storeToken(jwtToken: responseData.jwt);
      return responseData;
    } else {
      debugPrint('Error Message: ${response.statusCode}');
      return null;
    }
  }

  Future<ProfileSubmitResponse?> submitProfile(
      {required String name, required String email}) async {
    String jwtToken = await localStorage.getToken();
    debugPrint('sdbsadmasbd$jwtToken');
    const url = "https://test-otp-api.7474224.xyz/profilesubmit.php";
    final body = {
      "name": name,
      "email": email,
    };
    final Map<String, String> headers = {
      'Token': jwtToken,
    };
    final encodedBody = json.encode(body);
    final response =
        await http.post(Uri.parse(url), body: encodedBody, headers: headers);
    debugPrint("${response.statusCode}**88******${response.body}");
    if (response.statusCode == 200) {
      final ProfileSubmitResponse responseData =
          profileSubmitResponseFromJson(response.body);
      return responseData;
    } else {
      debugPrint('Error Message: ${response.statusCode}');
      return null;
    }
  }
}
