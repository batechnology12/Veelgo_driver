import 'dart:convert';
import 'dart:io';



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:veelgo/network/api_services/updatePersonol_profile.dart';

import 'package:veelgo/properties/common%20properties.dart';

import '../../dashboard/driver_mainscreen.dart';
import '../../login_reg_screens/PersonalDoc.dart';
import '../../login_reg_screens/createPasswrd.dart';
import '../../login_reg_screens/login.dart';
import '../../login_reg_screens/otp.dart';
import '../../networkApiServices/GetProfileServices.dart';
import '../../personolOtp.dart';
import '../api_services/forgotPassword_service.dart';
import '../api_services/login_service.dart';
import '../api_services/otp_service.dart';
import '../api_services/signup_service.dart';
import '../api_services/updateNric_service.dart';
import '../api_services/updatePassword_serivice.dart';


class AuthControllers extends GetxController {


  final LoginServicesApi loginServicesApi = LoginServicesApi();
  RxBool isLoading = false.obs;
  Future<void> login(BuildContext context, String email, String password) async {
    isLoading(true);
    final response = await loginServicesApi.login(email: email, password: password);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('---status true---');
      SnackbarUtils.showSnackbar(context, 'Login Successfully');
      Get.to(const MainDashboardScreen());
    } else {
      final responseData = jsonDecode(response.body);
      SnackbarUtils.showSnackbar(context,  responseData['message']);
    }
    isLoading(false);
    update();
  }


  final RegisterApiService _apiService = RegisterApiService();
  RxBool isload = false.obs;
  Future<void> register({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _apiService.register(

        name: name,
        email: email,
        mobile: mobile,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      isload.value =true;

      if (response.statusCode == 200 || response.statusCode == 201) {
        final registerData = jsonDecode(response.body);
        print(registerData);
        print('--api success--');

        String otp = registerData['otp'];

        await Future.delayed(Duration(seconds: 1));
        Get.snackbar('Success', 'Registration Successful');
        // Navigate to OTP verification screen
        Get.to(() => OtpVerification(otp: otp, phoneNumber: mobile,));
      } else {
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'];
        Get.snackbar('Error', errorMessage);
        print('invalid---');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    isload.value=false;
    update();
  }



  final ForgotPasswordService _forgotPasswordService = ForgotPasswordService();

  RxBool passwordload = false.obs;
  Future<void> forgotPassword(BuildContext context, String emailOrPhone) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );


    try {
      final Map<String, dynamic>? response = await _forgotPasswordService.forgotPassword(emailOrPhone);
      Get.back();
      passwordload.value = true;
      if (response?['status'] == true) {
        Get.to(RegisterOtpScreen( number: emailOrPhone));

      } else {
        SnackbarUtils.showSnackbar(context, 'Enter Valid Email');
      }
    } catch (e) {
      SnackbarUtils.showSnackbar(context, 'An error occurred');
    }
    passwordload.value=false;
    update();
  }


  final OtpService _otpService = OtpService();

  RxString currentText = "".obs;
  RxBool hasError = false.obs;
  RxBool otploading = false.obs;
  TextEditingController otpController = TextEditingController();

  void setCurrentText(String value) {
    currentText.value = value;
  }

  Future<void> verifyOtp(BuildContext context, String phone) async {
    if (currentText.value.length != 4) {
      SnackbarUtils.showSnackbar(context, 'Please enter a valid 4-digit OTP');
      return;
    }

    isLoading.value = true;

    try {
      final response = await _otpService.verifyOtp(phone, currentText.value);
      if (response?['status'] == true) {
        String token = response?['token'];
        // Save token to SharedPreferences if necessary
        Get.to(CreatePassword()); // Navigate to the next screen
      } else {
        SnackbarUtils.showSnackbar(context, response?['message'] ?? 'OTP verification failed');
      }
    } catch (e) {
      SnackbarUtils.showSnackbar(context, 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  final PasswordService passwordService = PasswordService();

  Future<void> changePassword(String password, String passwordConfirmation) async {
    try {
      bool success = await passwordService.updatePassword(password, passwordConfirmation);
      if (success) {
        Get.snackbar('Success', 'Updated password successfully');
        Get.to(LoginPage());
      } else {
        Get.snackbar('Error', 'Failed to update password');
      }
    } catch (e) {
      Get.snackbar('Error', 'Try again');
    }
  }


  final updatePersonolProfile _profileService = updatePersonolProfile();

  Future<void> uploadProfileImage(BuildContext context, File image) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.white)),
    );
    try {
      final profileImageUrl = await _profileService.updateProfilePicture(image);
      if (profileImageUrl != null) {
        Get.back();
        Get.snackbar('Success', 'Profile picture updated successfully');
        Get.to(const UpdateVehicleDetails());
        // Optionally, navigate to another page or update UI
      } else {
        Get.back();
        Get.snackbar('failed', 'Failed to update profile picture');
      }
    } catch (e) {
      Get.back();
      Get.snackbar('error', 'Error: ${e.toString()}');
    }
  }

  final NricService _nricService = NricService();

  Future<void> uploadNric(BuildContext context, File image) async {
    try {
      final nricImageUrl = await _nricService.uploadNricPicture(image);
      if (nricImageUrl != null) {
        Get.snackbar('Success', 'Nric updated successfully');
        Get.to(const UpdateAccount());
        // Optionally, navigate to another page or update UI
      } else {

        Get.snackbar('failed', 'Failed to update Nric picture');
      }
    } catch (e) {

      Get.snackbar('error', 'Error: ${e.toString()}');
    }
  }


}

