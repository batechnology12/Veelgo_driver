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
import 'package:veelgo/login_reg_screens/register.dart';

import '../commonClasses.dart';
import '../properties/common properties.dart';
import 'otp.dart';

class ForgotPassword extends StatefulWidget {
  final forpass apiService = forpass();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final forpass apiService = forpass();
 bool _isLoading = false;
  int selectedIndex = 0;
  String selectedValues = "+65";

  Future<void> _forgotPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.white)),
    );

    // Show loader when starting the operation
    setState(() {
      _isLoading = true; // Assuming _isLoading is a boolean variable in your State
    });

    try {
      final Map<String, dynamic> response = await widget.apiService.forgotPassword(_emailController.text.trim(),);

      if (response['status'] == true) {
        Navigator.pop(context);

        // Navigate to RegisterOtpScreen when successful
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RegisterOtpScreen(otp: '',number: _emailController.text.toString())),
        );
      } else {
        // Show error message if status is not true
        setState(() {
          Navigator.pop(context);
          SnackbarUtils.showSnackbar(context, 'Enter Valid Email');
        });
      }
    } catch (e) {
      // Handle API call error
      setState(() {
        Navigator.pop(context);
        SnackbarUtils.showSnackbar(context, 'An error occurred');
      });
    } finally {
      // Hide loader whether API call succeeded or failed
      setState(() {
        _isLoading = false;
      });
    }
  }



  bool isLoading = false;

  String _errorMessage = '';


  @override
  void dispose() {
 _emailController.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:  Icon(
              Icons.arrow_back_ios_new,
              size: 17.sp,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Forgot Password",
            style: inter1.copyWith(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              SvgPicture.asset('assets/psswrd.svg'),
              SizedBox(height: 30),
              Text(
                "First, Let's find your account",
                style: inter1.copyWith(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Please enter your registered email',
                style: inter1.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.blueGrey),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFormAddedNumbr(
                  controller: _emailController,
                  keyboardType: TextInputType.number,
                  hinttext: const Text('Enter your registered phone number'),
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

                                child: Text("+65",style: poppins2,),
                              ),
                            ),
                            PopupMenuItem<int>(
                              value: 1,
                              child: Container(
                                height: 30,
                                child: Text("+91",style: poppins2,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(selectedValues == "+65" ? 8 : 10),
                  ],

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your 6-digit code';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: InkWell(
                  onTap: isLoading ? null : _forgotPassword,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:AppColors.primaryColor,
                    ),
                    child: Center(
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                        "Reset Password",
                        style: inter1.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                     Get.offAll(Register());
                    },
                    child: Text(
                      "Create Account",
                      style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


