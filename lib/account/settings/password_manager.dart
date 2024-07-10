// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:veelgo/account/settings.dart';
//
// import '../../commonClasses.dart';
// import '../../properties/common properties.dart';
//
//
// class PasswordManager extends StatefulWidget {
//   const PasswordManager({super.key});
//
//   @override
//   State<PasswordManager> createState() => _PasswordManagerState();
// }
//
// class _PasswordManagerState extends State<PasswordManager> {
//   TextEditingController currentPassword = TextEditingController();
//   TextEditingController newPassword = TextEditingController();
//   TextEditingController confirmPassword = TextEditingController();
//
//   bool currentPasswordVisible = false;
//   bool newPasswordVisible = false;
//   bool confirmPasswordVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(
//             Icons.arrow_back_ios_new_outlined,
//             size: 16.sp,
//           ),
//         ),
//         title: Text(
//           'Password Manager',
//           style: poppins1.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             buildPasswordField(
//               'Current Password',
//               'Enter your current password',
//               currentPassword,
//               currentPasswordVisible,
//                   () {
//                 setState(() {
//                   currentPasswordVisible = !currentPasswordVisible;
//                 });
//               },
//             ),
//             buildPasswordField(
//               'New Password',
//               'Enter your new password',
//               newPassword,
//               newPasswordVisible,
//                   () {
//                 setState(() {
//                   newPasswordVisible = !newPasswordVisible;
//                 });
//               },
//             ),
//             buildPasswordField(
//               'Confirm Password',
//               'Re-enter your new password',
//               confirmPassword,
//               confirmPasswordVisible,
//                   () {
//                 setState(() {
//                   confirmPasswordVisible = !confirmPasswordVisible;
//                 });
//               },
//             ),
//             SizedBox(height: 20.h),
//
//           ],
//         ),
//       ),
//         bottomNavigationBar: Container(
//           height: 70.h,
//           child: Padding(
//             padding: EdgeInsets.all(12),
//             child: SizedBox(
//               height: 46.h,
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                      validateFields();
//
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: AppColors.primaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Text(
//                       'Password Manager',
//                       style: inter1.copyWith(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 14.sp,
//                         color: Colors.white,
//                         letterSpacing: 1,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         )
//     );
//   }
//
//   Widget buildPasswordField(
//       String label,
//       String hintText,
//       TextEditingController controller,
//       bool isVisible,
//       VoidCallback toggleVisibility,
//       ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w800),
//         ),
//         SizedBox(height: 8.h),
//         TextFieldBorder(
//           hintText: hintText,
//           controller: controller,
//           obscureText: !isVisible,
//           validator: validatePassword,
//           trailingIcon: GestureDetector(
//             onTap: toggleVisibility,
//             child: Icon(
//               isVisible ? Icons.visibility : Icons.visibility_off,
//             ),
//           ),
//
//         ),
//         SizedBox(height: 16.h),
//       ],
//     );
//   }
//
//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'This field cannot be empty';
//     }
//     return null;
//   }
//
//   void validateFields() {
//     if (currentPassword.text.isEmpty) {
//       SnackbarUtils.showSnackbar(context, 'Please enter your current password');
//
//       return;
//     }
//     if (newPassword.text.isEmpty) {
//       SnackbarUtils.showSnackbar(context, 'Please enter your new password');
//       return;
//     }
//     if (confirmPassword.text.isEmpty) {
//       SnackbarUtils.showSnackbar(context, 'Please confirm your new password');
//       return;
//     }
//     if (newPassword.text != confirmPassword.text) {
//       SnackbarUtils.showSnackbar(context, 'New password and confirm password do not match');
//       return;
//     }
//     // Navigate to the next page if all validations pass
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return WillPopScope(
//           onWillPop: () async {
//             // Return false to prevent the back button from closing the dialog
//             return false;
//           },
//           child: AlertDialog(
//             title:  Text('Update Password Manager',style: inter1.copyWith(fontWeight: FontWeight.w900,fontSize: 20.sp),),
//             content:  Text('Updated successfully!',style: poppins1.copyWith(fontWeight: FontWeight.w900,fontSize: 14.sp,color: AppColors.primaryColor),),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Get.offAll(const AccountSettings());
//                   // Get.offAll(UpdateNIRC());
//                 },
//                 child: Container(
//
//                     decoration: BoxDecoration(
//                       color: Colors.blue.shade100,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
//                       child:  Text('OK',style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700,color: AppColors.primaryColor),),
//                     )),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/account/settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../commonClasses.dart';
import '../../properties/common properties.dart';

class PasswordManager extends StatefulWidget {
  const PasswordManager({super.key});

  @override
  State<PasswordManager> createState() => _PasswordManagerState();
}

class _PasswordManagerState extends State<PasswordManager> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool currentPasswordVisible = false;
  bool newPasswordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 16.sp,
          ),
        ),
        title: Text(
          'Password Manager',
          style: poppins1.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildPasswordField(
              'Current Password',
              'Enter your current password',
              currentPassword,
              currentPasswordVisible,
                  () {
                setState(() {
                  currentPasswordVisible = !currentPasswordVisible;
                });
              },
            ),
            buildPasswordField(
              'New Password',
              'Enter your new password',
              newPassword,
              newPasswordVisible,
                  () {
                setState(() {
                  newPasswordVisible = !newPasswordVisible;
                });
              },
            ),
            buildPasswordField(
              'Confirm Password',
              'Re-enter your new password',
              confirmPassword,
              confirmPasswordVisible,
                  () {
                setState(() {
                  confirmPasswordVisible = !confirmPasswordVisible;
                });
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            height: 46.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                validateFields();
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'Password Managers',
                    style: inter1.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField(
      String label,
      String hintText,
      TextEditingController controller,
      bool isVisible,
      VoidCallback toggleVisibility,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 8.h),
        TextFieldBorder(
          hintText: hintText,
          controller: controller,
          obscureText: !isVisible,
          validator: validatePassword,
          trailingIcon: GestureDetector(
            onTap: toggleVisibility,
            child: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }



  Future<void>  updatePassword(String currentPassword, String newPassword, String newPasswordConfirmation) async {
    final url = 'https://veelgo.digitaldatatechnologia.in/api/updatePassword';
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString("auth_token");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authtoken',// Replace with your actual token
    };
    final body = json.encode({
      'current_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation,
    });



    try {

      final response = await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          SnackbarUtils.showSnackbar(context, 'Password updated successfully');
          Get.back();
        } else {
          showSnackBar(responseData['message']);
        }
      } else {
        showSnackBar('Failed to update password');
      }
    } catch (error) {
      showSnackBar('An error occurred: $error');
    }
  }

  void validateFields() {
    if (currentPassword.text.isEmpty) {
      showSnackBar('Please enter your current password');
      return;
    }
    if (newPassword.text.isEmpty) {
      showSnackBar('Please enter your new password');
      return;
    }
    if (confirmPassword.text.isEmpty) {
      showSnackBar('Please confirm your new password');
      return;
    }
    if (newPassword.text != confirmPassword.text) {
      showSnackBar('New password and confirm password do not match');
      return;
    }

    // Call the API to update the password
    updatePassword(currentPassword.text, newPassword.text, confirmPassword.text);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
