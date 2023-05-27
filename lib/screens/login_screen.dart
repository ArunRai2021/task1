import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1/custom_widgets/custom_snackbar.dart';
import 'package:task_1/screens/otp_screen.dart';
import 'package:task_1/services/apis.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 6),
                  Row(
                    children: const <Widget>[
                      CircleAvatar(
                        radius: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Get Started",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      prefix: Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: const BoxDecoration(
                          border:
                              Border(right: BorderSide(color: Colors.black)),
                        ),
                        child: const Text("+91"),
                      ),
                      fillColor: const Color(0xffFAFAFA),
                      filled: true,
                      hintText: "Enter Mobile Number",
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 18.0, top: 18.0),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (phoneController.text.length == 10 &&
                              phoneController.text == "9090909090" ||
                          phoneController.text == "8888888888") {
                        setState(() {
                          isLoading = true;
                        });
                        bool? status =
                            await Apis().getOtp(phoneController.text);
                        if (status) {
                          setState(() {
                            isLoading = false;
                          });
                          Get.to(() => OtpScreen(
                                phone: phoneController.text,
                              ));
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(context,
                                  snackMessage: "something went wrong!"));
                        }
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(context,
                                snackMessage: "Please Enter Valid Mobile No"));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(color: Colors.black),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
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
