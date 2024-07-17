import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veelgo/commonClasses.dart';
import 'package:veelgo/controller/authController.dart';
import 'package:veelgo/dashboard/driver_mainscreen.dart';
import 'package:veelgo/login_reg_screens/register.dart';
import 'package:veelgo/properties/common%20properties.dart';

import '../apiCalls.dart';
import '../network/controllers/auth_api_controllers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _isChecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginApi _apiProvider = LoginApi();
  int selectedIndex = 0;
  String selectedValues = "+65";

  final AuthControllers authController = Get.put(AuthControllers());

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      authController.login(context, _emailController.text.trim(),
          _passwordController.text.trim());
    }
  }

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: 200.h,
          centerTitle: true,
          leading: Container(), // This will remove the back arrow icon
          title: RichText(
            text: TextSpan(
              style: times.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
                color: Colors.black, // Default color for "VEEL"
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'VEEL', style: inter1.copyWith(color: Colors.white)),
                TextSpan(
                    text: 'GO',
                    style: inter1.copyWith(color: Colors.yellowAccent)),
              ],
            ),
          ),
        ),
        body: Obx(() => authController.isLoading.isTrue
            ? Container(child: const CircularLoadingIndicator())
            : SingleChildScrollView(
                child: Container(
                  height: 500.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: inter1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                  color: Colors.black),
                            ),
                            Text(
                              'Enter your phone number and Password',
                              style: inter1.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  color: AppColors.bluegrey),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone Number *',
                                style: inter1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: Colors.blueGrey),
                              ),
                              ksize5,
                              TextFormAddedNumbr(
                                controller: _emailController,
                                keyboardType: TextInputType.number,
                                leadingIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            selectedValues =
                                                value == 0 ? "+65" : "+91";
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
                                    return 'Please enter your 6-digit code';
                                  }
                                  return null;
                                },
                              ),
                              ksize20,
                              Text(
                                'Password *',
                                style: inter1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: Colors.blueGrey),
                              ),
                              ksize5,
                              TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  filled: true, // Fill the background color
                                  fillColor: Colors
                                      .grey[200], // Set the background color
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide:
                                        BorderSide.none, // Remove border
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    // Customize focused border
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                      color: AppColors
                                          .primaryColor, // Set indicator color
                                      width: 0.1, // Set indicator width
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                style: TextStyle(fontSize: 17.sp),
                                obscureText: !_isPasswordVisible,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isChecked = value!;
                                          });
                                        },
                                        activeColor: AppColors.primaryColor,
                                      ),
                                      Text('Remember me',
                                          style: inter1.copyWith(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w900)),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/forgotPassword');
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: inter1.copyWith(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              ksize50,
                              Center(
                                child: SizedBox(
                                  height: 45.h,
                                  width: size.width,
                                  child: ElevatedButton(
                                    onPressed: () => _login(context),
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.primaryColor,
                                      side: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Text(
                                      'Log In',
                                      style: inter1.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ksize30,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account ?",
                                    style: inter1.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(width: 3.w),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(const Register());
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: inter1.copyWith(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )));
  }
}
