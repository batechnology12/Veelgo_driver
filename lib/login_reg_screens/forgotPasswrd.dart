import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:veelgo/apiCalls.dart';
import 'package:veelgo/controller/authController.dart';
import 'package:veelgo/login_reg_screens/register.dart';
import 'package:veelgo/network/controllers/auth_api_controllers.dart';

import '../commonClasses.dart';
import '../properties/common properties.dart';
import 'otp.dart';

class ForgotPassword extends StatefulWidget {
  // final forpass apiService = forpass();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  AuthControllers forgotPasswordController = AuthControllers();

  bool _isLoading = false;
  int selectedIndex = 0;
  String selectedValues = "+65";

  bool isLoading = false;


  @override
  void dispose() {
    _emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 17.sp,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  "Forgot Password",
                  style: inter1.copyWith(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              body: Obx(() => forgotPasswordController.passwordload.value
                 ? Container(child: const CircularLoadingIndicator())
                 :SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    SvgPicture.asset('assets/psswrd.svg'),
                    const SizedBox(height: 30),
                    Text(
                      "First, Let's find your account",
                      style: inter1.copyWith(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Please enter your registered phone number',
                      style: inter1.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormAddedNumbr(
                        controller: _emailController,
                        keyboardType: TextInputType.number,
                        hinttext:
                            const Text('Enter your registered phone number'),
                        leadingIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PopupMenuButton<int>(
                                child: Container(
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      selectedValues,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                onSelected: (value) {
                                  setState(() {
                                    selectedIndex = value;
                                    selectedValues = value == 0 ? "+65" : "+91";
                                    // Update input formatters based on selected country code
                                    _emailController.text = '';
                                  });
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem<int>(
                                    value: 0,
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "+65",
                                        style: poppins2,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        "+91",
                                        style: poppins2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(
                              selectedValues == "+65" ? 8 : 10),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your 8-digit code';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: InkWell(
                        onTap: () => forgotPasswordController.forgotPassword(
                          context,
                          _emailController.text.trim(),),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.primaryColor,
                          ),
                          child: Center(
                            child:  Text(
                                    "Reset Password",
                                    style: inter1.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: inter1.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            Get.offAll(const Register());
                          },
                          child: Text(
                            "Create Account",
                            style: inter1.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    ));
  }
}
