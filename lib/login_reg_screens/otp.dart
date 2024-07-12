import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../network/controllers/auth_api_controllers.dart';
import '../properties/common properties.dart';
import 'createPasswrd.dart';
 // Assuming you have a SnackbarUtils class for showing snackbars

class RegisterOtpScreen extends StatefulWidget {

  final String number;

  const RegisterOtpScreen({Key? key,required this.number}) : super(key: key);

  @override
  _RegisterOtpScreenState createState() => _RegisterOtpScreenState();
}

class _RegisterOtpScreenState extends State<RegisterOtpScreen> {
  TextEditingController otpController = TextEditingController();

  final AuthControllers otpControllers = Get.put(AuthControllers());
  String currentText = "";
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    otpControllers.otpController.text = '0000';
    // verifyOtp();
  }

  Future<void> verifyOtp() async {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );

    final url = 'https://veelgo.digitaldatatechnologia.in/api/verify_otp';
    final response = await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'phone': widget.number,
        'otp': currentText,
      }),
    );

    if (response.statusCode == 200) {
      Get.back();
      final data = jsonDecode(response.body);
      if (data['status']==true) {
        String token = data['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('fpotp_token', token);
        print(token);
        print('----------------yoy');
        // OTP verification successful
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreatePassword()),
        );
      } else {
        Get.back();
        // OTP verification failed
        SnackbarUtils.showSnackbar(context, data['message']);
      }
    } else {
      Get.back();
      // API call failed
      SnackbarUtils.showSnackbar(context, 'Something went wrong. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 19,
          ),
        ),
        title: Text(
          'Verification',
          style: inter1.copyWith(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ksize20,
                  Text(
                    'Phone Verification',
                    style: inter1.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ksize5,
                  RichText(
                    text: TextSpan(
                      text: 'Code is sent to ',
                      style: inter1.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.bluegrey,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.number,
                          style: inter1.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ksize50,
                  PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: inter1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: false,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,
                    validator: (v) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (v!.length < 4) {
                          setState(() {
                            hasError = true;
                          });
                        } else {
                          setState(() {
                            hasError = false;
                          });
                        }
                      });
                      return null;
                    },
                    pinTheme: PinTheme(
                      selectedFillColor: const Color(0xffF8F8F8),
                      activeColor: AppColors.primaryColor,
                      inactiveColor: const Color(0xffF8F8F8),
                      selectedColor: const Color(0xffF8F8F8),
                      inactiveFillColor: Colors.grey[200],
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(9),
                      fieldHeight: 60,
                      fieldWidth: 60,
                      activeFillColor: hasError ? Colors.blue.shade50 : const Color(0xffF8F8F8),
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    textStyle: inter1.copyWith(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    controller: otpController,
                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                        hasError = false;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                  ),
                  ksize20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive code?",
                        style: inter1.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      wsize10,
                      GestureDetector(
                        onTap: () {
                          // Implement resend code logic here
                        },
                        child: Text(
                          'Request again',
                          style: inter1.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        child: InkWell(
          onTap: () {
            if (currentText.length == 4) {
              verifyOtp();
            } else {
              SnackbarUtils.showSnackbar(context, 'Please enter a valid 4-digit OTP');
            }
          },
          child: Container(
            height: 45.h,
            width: size.width,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'Verify',
                style: inter1.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
