import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:task_1/custom_widgets/custom_snackbar.dart';
import 'package:task_1/model/verify_otp_response.dart';
import 'package:task_1/screens/profile_screen.dart';
import 'package:task_1/services/apis.dart';

import 'HomeScreen/home_screen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key, required this.phone}) : super(key: key);
  final String phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isOtpFilled = false;
  bool isLoading = false;

  String? enteredOTP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 6),
                    const CircleAvatar(
                      radius: 50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Enter OTP",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "OTP has been sent to +91 ${widget.phone}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OtpTextField(
                      onSubmit: (String val) {
                        if (val.length == 6) {
                          isOtpFilled = true;
                          enteredOTP = val;
                        } else {
                          isOtpFilled = false;
                        }
                      },
                      numberOfFields: 6,
                      showFieldAsBox: true,
                      filled: true,
                      fillColor: const Color(0xffFAFAFA),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      cursorColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      enabledBorderColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (isOtpFilled && enteredOTP != null) {
                          setState(() {
                            isLoading = true;
                          });
                          VerifyOtpResponse? response =
                              await Apis().verifyOtp(enteredOTP!);
                          if (response != null && response.status) {
                            if (response.profileExists) {
                              setState(() {
                                isLoading = false;
                              });
                              Get.to(() => const HomeScreen());
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              Get.to(() => const ProfileScreen());
                            }
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(context,
                                    snackMessage: "Please enter valid OTP"));
                          }
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const BoxDecoration(color: Colors.black),
                        child: const Center(
                          child: Text(
                            "verify",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Retry(this button Send back to first screen,with number entered",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isLoading,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
