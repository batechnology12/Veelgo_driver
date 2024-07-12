// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:veelgo/properties/common%20properties.dart';
//
// import 'login_reg_screens/PersonalDoc.dart';
// // Adjust this import to your actual path
//
// class OtpVerification extends StatefulWidget {
//   final String otp;
//   final String phn;
//
//     OtpVerification({Key? key, required this.otp, required this.phn}) : super(key: key);
//
//   @override
//   State<OtpVerification> createState() => _OtpVerificationState();
// }
//
// class _OtpVerificationState extends State<OtpVerification> {
//   late TextEditingController _otpController1;
//   late TextEditingController _otpController2;
//   late TextEditingController _otpController3;
//   late TextEditingController _otpController4;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers with OTP digits
//     _otpController1 = TextEditingController(text: widget.otp.length >= 1 ? widget.otp.substring(0, 1) : '');
//     _otpController2 = TextEditingController(text: widget.otp.length >= 2 ? widget.otp.substring(1, 2) : '');
//     _otpController3 = TextEditingController(text: widget.otp.length >= 3 ? widget.otp.substring(2, 3) : '');
//     _otpController4 = TextEditingController(text: widget.otp.length >= 4 ? widget.otp.substring(3, 4) : '');
//   }
//
//   @override
//   void dispose() {
//     _otpController1.dispose();
//     _otpController2.dispose();
//     _otpController3.dispose();
//     _otpController4.dispose();
//     super.dispose();
//   }
//
//   void _verifyAndNavigate() {
//     String enteredOtp = _otpController1.text +
//         _otpController2.text +
//         _otpController3.text +
//         _otpController4.text;
//
//     if (enteredOtp == widget.otp) {
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.white,)),
//       );
//
//       Future.delayed(const Duration(seconds: 2), () {
//         Navigator.pop(context);
//         SnackbarUtils.showSnackbar(context, 'Otp Success');
//         Get.to( UpdateProfile());
//       });
//
//     }else {
//       // OTP is incorrect, show snackbar
//           SnackbarUtils.showSnackbar(context, 'Invalid OTP, Try again');
//
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     final size = MediaQuery.of(context).size;
//     final sWidth = size.width;
//     final sHeight = size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_new,
//             size: 17,
//             color: Colors.black,
//           ),
//         ),
//         title:  Text(
//           "Verification",
//           style: inter1.copyWith(
//               color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Phone Verification',
//                           style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 24),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               'Code sent to + ',
//                               style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 13, color: AppColors.bluegrey),
//                             ),
//                             Text(
//                               widget.phn,
//                               style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: AppColors.primaryColor),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   ksize20,
//                   ksize20,
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         _buildOtpDigitContainer(_otpController1),
//                         _buildOtpDigitContainer(_otpController2),
//                         _buildOtpDigitContainer(_otpController3),
//                         _buildOtpDigitContainer(_otpController4),
//                       ],
//                     ),
//                   ),
//                   ksize20,
//                   TextButton(
//                     onPressed: () {
//                       // Handle resend OTP action
//                       // Example: Implement resend functionality here
//                       print("Resend OTP");
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Don't You have Receive Code?",
//                           style: inter1.copyWith(fontWeight: FontWeight.w700, color: AppColors.bluegrey, fontSize: 12.sp),
//                         ),
//                         wsize10,
//                         Text(
//                           "Resend Code",
//                           style: poppins1.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w800, fontSize: 11.sp),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//               child: SizedBox(
//                 height: 47.h,
//                 width: size.width,
//                 child: ElevatedButton(
//                   onPressed: _verifyAndNavigate,
//                   style: ElevatedButton.styleFrom(
//                     primary: AppColors.primaryColor, // Background color
//                     side: const BorderSide(
//                         color: AppColors.primaryColor, width: 1), // Border color and width
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30), // Rounded corners
//                     ),
//                   ),
//                   child: Text(
//                     'Submit',
//                     style: inter1.copyWith(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.sp,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOtpDigitContainer(TextEditingController controller) {
//     return Container(
//       width: 50,
//       height: 55,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(
//         child: TextFormField(
//           controller: controller,
//           enabled: true,
//           textAlign: TextAlign.center,
//           maxLength: 1,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(
//             counterText: "",
//             border: InputBorder.none,
//           ),
//           style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.bluegrey),
//           onChanged: (value) {
//             // Handle OTP input change (if needed)
//           },
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/properties/common%20properties.dart';
import 'package:http/http.dart' as http;
import 'login_reg_screens/PersonalDoc.dart'; // Adjust this import to your actual path

class OtpVerification extends StatefulWidget {
  final String otp;
  final String phoneNumber;

  OtpVerification({Key? key, required this.otp, required this.phoneNumber,}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  late TextEditingController _otpController1;
  late TextEditingController _otpController2;
  late TextEditingController _otpController3;
  late TextEditingController _otpController4;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with OTP digits
    _otpController1 = TextEditingController(text: widget.otp.length >= 1 ? widget.otp.substring(0, 1) : '');
    _otpController2 = TextEditingController(text: widget.otp.length >= 2 ? widget.otp.substring(1, 2) : '');
    _otpController3 = TextEditingController(text: widget.otp.length >= 3 ? widget.otp.substring(2, 3) : '');
    _otpController4 = TextEditingController(text: widget.otp.length >= 4 ? widget.otp.substring(3, 4) : '');
  }

  @override
  void dispose() {
    _otpController1.dispose();
    _otpController2.dispose();
    _otpController3.dispose();
    _otpController4.dispose();
    super.dispose();
  }

  void _verifyAndNavigate() async {
    String enteredOtp = _otpController1.text +
        _otpController2.text +
        _otpController3.text +
        _otpController4.text;

    if (enteredOtp.isNotEmpty) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.white)),
      );

      final response = await http.post(
        Uri.parse('https://veelgo.digitaldatatechnologia.in/api/verify_otp'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'phone': widget.phoneNumber,
          'otp': enteredOtp,
        }),
      );

      Navigator.pop(context);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          SnackbarUtils.showSnackbar(context, 'OTP verification successful.');
          // Store the token if needed
          String token = responseData['token'];
          print(token);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("auth_token", responseData["token"]);
          print('-------------------');
          // Navigate to the UpdateProfile screen
          Get.to(UpdateProfile());
        } else {
          SnackbarUtils.showSnackbar(context, 'Invalid OTP, Try again');
        }
      } else {
        SnackbarUtils.showSnackbar(context, 'Error occurred, please try again');
      }
    } else {
      SnackbarUtils.showSnackbar(context, 'Please enter the OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 17,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Verification",
          style: inter1.copyWith(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Verification',
                          style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 24),
                        ),
                        Row(
                          children: [
                            Text(
                              'Code sent to + ',
                              style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 13, color: AppColors.bluegrey),
                            ),
                            Text(
                              widget.phoneNumber,
                              style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: AppColors.primaryColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  ksize20,
                  ksize20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildOtpDigitContainer(_otpController1),
                        _buildOtpDigitContainer(_otpController2),
                        _buildOtpDigitContainer(_otpController3),
                        _buildOtpDigitContainer(_otpController4),
                      ],
                    ),
                  ),
                  ksize20,
                  TextButton(
                    onPressed: () {
                      // Handle resend OTP action
                      // Example: Implement resend functionality here
                      print("Resend OTP");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't You have Receive Code?",
                          style: inter1.copyWith(fontWeight: FontWeight.w700, color: AppColors.bluegrey, fontSize: 12.sp),
                        ),
                        wsize10,
                        Text(
                          "Resend Code",
                          style: poppins1.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w800, fontSize: 11.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                height: 47.h,
                width: size.width,
                child: ElevatedButton(
                  onPressed: _verifyAndNavigate,
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor, // Background color
                    side: const BorderSide(
                        color: AppColors.primaryColor, width: 1), // Border color and width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: inter1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpDigitContainer(TextEditingController controller) {
    return Container(
      width: 50,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          enabled: true,
          textAlign: TextAlign.center,
          maxLength: 1,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.bluegrey),
          onChanged: (value) {
            // Handle OTP input change (if needed)
          },
        ),
      ),
    );
  }
}

