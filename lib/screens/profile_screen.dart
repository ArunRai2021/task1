import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1/custom_widgets/custom_snackbar.dart';
import 'package:task_1/model/profile_submit_response.dart';
import 'package:task_1/services/apis.dart';
import 'HomeScreen/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  bool onSubmit() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Looks like you are a new here .tell us a bit about yourself",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      fillColor: Color(0xffFAFAFA),
                      filled: true,
                      hintText: "Name",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 18.0, top: 18.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    validator: (val) {
                      if (val != null) {
                        if (val.length < 3) {
                          return 'Name should have at least 3 characters';
                        }
                      } else {
                        return "Name can't be empty";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      fillColor: Color(0xffFAFAFA),
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 18.0, top: 18.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    validator: (val) {
                      if (val != null) {
                        if (!emailRegex.hasMatch(val)) {
                          return 'Please add valid email';
                        }
                      } else {
                        return "Email can't be empty";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      bool status = onSubmit();
                      if (status) {
                        setState(() {
                          isLoading = true;
                        });
                        ProfileSubmitResponse? profileResponse = await Apis()
                            .submitProfile(
                                name: nameController.text,
                                email: emailController.text);
                        if (profileResponse != null) {
                          setState(() {
                            isLoading = false;
                          });
                          if (profileResponse.status) {
                            Get.to(() => const HomeScreen());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(context,
                                    snackMessage: profileResponse.response));
                          }
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                              context,
                              snackMessage: "something went wrong!"));
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(color: Colors.black),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
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
          )),
    );
  }
}

final RegExp emailRegex = RegExp(
  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
);
