import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veelgo/apiCalls.dart';
import 'package:veelgo/commonClasses.dart';

import '../properties/common properties.dart';
import '../personolOtp.dart';
import 'fleetotp.dart';

class FleetPartnerContent extends StatefulWidget {
  const FleetPartnerContent({super.key});

  @override
  State<FleetPartnerContent> createState() => _FleetPartnerContentState();
}

class _FleetPartnerContentState extends State<FleetPartnerContent> {
  bool _isChecked = false;
  bool _izChecked = false;
  TextEditingController companyNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController businessMailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  int selectedIndex = 0;
  String selectedValues = "+65";

  final RegisterFleetApi apiService = RegisterFleetApi();
  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState!.validate() && _isChecked) {
      final String companyName = companyNameController.text;
      final String name = nameController.text;
      final String businessEmail = businessMailController.text;
      final String mobile = phoneNumberController.text;
      final String password = passwordController.text;
      final String confirmPassword = confirmPasswordController.text;

      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            Center(child: CircularProgressIndicator(color: Colors.white)),
      );

      try {
        final response = await apiService.register(
          type: 'fleet_partner',
          companyName: companyName,
          name: name,
          businessEmail: businessEmail,
          mobile: mobile,
          password: password,
          passwordConfirmation: confirmPassword,
        );

        // Dismiss loading dialog
        Navigator.of(context, rootNavigator: true).pop();

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Parse OTP from the response
          final Map<String, dynamic> registerData = jsonDecode(response.body);
          String otp = registerData['otp'];
          String phn = phoneNumberController.text;

          // Show success message and navigate to OTP verification screen
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pop(context); // Remove current screen from stack
            Get.to(FleetOtpVerification(otp: otp, phn: phn));
          });
        } else {
          // Show failure message from API response
          final Map<String, dynamic> responseBody = jsonDecode(response.body);
          String errorMessage = responseBody['message'];
          SnackbarUtils.showSnackbar(context, errorMessage);
        }
      } catch (e) {
        // Dismiss loading dialog on error
        Navigator.of(context, rootNavigator: true).pop();

        // Show error message
        SnackbarUtils.showSnackbar(context, 'An error occurred');
      }
    } else {
      // Show validation error message
      SnackbarUtils.showSnackbar(
          context, 'Fill out the form correctly & agree to the terms');
    }
  }

  @override
  void dispose() {
    companyNameController.clear();
    nameController.clear();
    businessMailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Company Name *', style: interMedi),
              ksize5,
              CustomTextFormField(controller: companyNameController),
              ksize10,
              Text('Name *', style: interMedi),
              ksize5,
              CustomTextFormField(controller: nameController),
              ksize10,
              Text('Buisness Email ID *', style: interMedi),
              ksize5,
              CustomTextFormField(
                controller: businessMailController,
              ),
              ksize10,
              Text('Phone Number *', style: interMedi),
              ksize5,
              TextFormAddedNumbr(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
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
                            phoneNumberController.text = '';
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
              ksize10,
              Text('Password *', style: interMedi),
              ksize5,
              CustomTextFormField(
                controller: passwordController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
              ),
              ksize10,
              Text('Confirm Password *', style: interMedi),
              ksize5,
              CustomTextFormField(
                controller: confirmPasswordController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      if (value != null) {
                        // Ensure value is not null
                        setState(() {
                          _isChecked = value;
                        });
                      }
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text:
                            'I have agree read and agree to the data pintection notice',
                        style: inter1.copyWith(
                          color: AppColors.bluegrey,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        children: <TextSpan>[],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _izChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _izChecked = value!;
                      });
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: 'I have read and agree to the',
                        style: inter1.copyWith(
                          color: AppColors.bluegrey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: inter1.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            // Add your onTap handler here for navigation or any action
                          ),
                          const TextSpan(
                            text: ' & ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: inter1.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            // Add your onTap handler here for navigation or any action
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Center(
                child: SizedBox(
                  height: 47.h,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      primary: AppColors
                          .primaryColor, // Background color// Text color
                      side: const BorderSide(
                          color: AppColors.primaryColor, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Rounded corners
                      ),
                      // Border color and width
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
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
