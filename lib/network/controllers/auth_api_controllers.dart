import 'dart:convert';
import 'dart:io';


import 'package:dio/dio.dart'as dio;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/network/api_services/updatePersonol_profile.dart';

import 'package:veelgo/properties/common%20properties.dart';

import '../../apiCalls.dart';
import '../../dashboard/driver_mainscreen.dart';
import '../../login_reg_screens/PersonalDoc.dart';
import '../../login_reg_screens/createPasswrd.dart';
import '../../login_reg_screens/login.dart';
import '../../login_reg_screens/otp.dart';
import '../../modelClasses/getDriverBookings.dart';
import '../../modelClasses/my_earnings.dart';
import '../../modelClasses/my_profile.dart';
import '../../modelClasses/notification_model.dart';
import '../../modelClasses/ongoing_orders.dart';
import '../../modelClasses/transactionHistory.dart';
import '../../networkApiServices/GetProfileServices.dart';
import '../../personolOtp.dart';
import '../api_services/forgotPassword_service.dart';
import '../api_services/get_earnings_service.dart';
import '../api_services/login_service.dart';
import '../api_services/notification_service.dart';
import '../api_services/ongoing_services.dart';
import '../api_services/otp_service.dart';
import '../api_services/signup_service.dart';
import '../api_services/transactionHistory_service.dart';
import '../api_services/updateBankService.dart';
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

  GetProfileServiceData profileApiServices = GetProfileServiceData();
  Data? getUserData;
  RxBool bankload = false.obs;

  void getProfile() async {
    bankload.value = true;
    try {
      dio.Response<dynamic> response = await profileApiServices.getProfileApi();
      if (response.data["status"] == true) {
        GetUserModel getUserModel = GetUserModel.fromJson(response.data);
        print(getUserModel);
        print('-------------------');
        getUserData = getUserModel.data;
        Get.rawSnackbar(
          backgroundColor: AppColors.accentColor,
          messageText: Text(
            response.data['message'],
            style: inter1.copyWith(color: Colors.black, fontSize: 15.sp),
          ),
        );
      } else {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data['message'],
            style: inter1.copyWith(color: Colors.white, fontSize: 15.sp),
          ),
        );
      }  bankload.value=false;
      update();

    } catch (e){
      bankload.value=false;
      print(e);
    }
    
  }


  DateTime? _startDate;
  DateTime? _endDate;
  GetEarningModel? _earningData;
  bool _loading = false;

  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  GetEarningModel? get earningData => _earningData;
  bool get loading => _loading;

  final EarningsService _earningsService = EarningsService();

  void onDateChange(DateTime date) {
    if (_startDate == null) {
      _startDate = date; // Select as start date
    } else if (_endDate == null && date.isAfter(_startDate!)) {
      _endDate = date; // Select as end date
      _fetchEarnings(); // Fetch earnings when end date is selected
    } else {
      // Reset selection if the selected date is before the start date
      _startDate = date;
      _endDate = null;
    }
    update(); // Notify listeners
  }

  Future<void> _fetchEarnings() async {
    if (_startDate != null && _endDate != null) {
      _loading = true;
      update();
      try {
        final data = await _earningsService.fetchEarnings(
          _startDate!.toIso8601String(),
          _endDate!.toIso8601String(),
        );
        _earningData = data;
      } catch (e) {
        // Handle error
      } finally {
        _loading = false;
        update();
      }
    }
  }



  final NotificationApiService notificationApiServices = NotificationApiService();
  var notificationList = <NotificationData>[].obs; // Use RxList for reactivity
  var notificationLoading = false.obs;

  Future<void> getNotification() async {
    notificationLoading(true);
    try {
      final response = await notificationApiServices.notificationApi();
      notificationLoading(false);

      // Print the entire response data
      print('Response Data: ${response.data}');

      if (response.data["status"] == true) {
        GetNotificationModel notificationModel = GetNotificationModel.fromJson(response.data);
        notificationList.assignAll(notificationModel.data);
       // Update the list reactively
      } else {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data['message'],
            style: TextStyle(color: Colors.white, fontSize: 15.sp),
          ),
        );
      }
    } catch (e) {
      notificationLoading(false);
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          'Failed to load notifications: $e',
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
    }
  }


  var walletHistory = <WalletHistory>[].obs;
  var walletBalance = 0.obs;
  final TransactionService _transactionService = TransactionService();
  var historeload = true.obs;


  @override
  void onInit() {
    super.onInit();
    fetchTransactions("All"); // Default to fetching all transactions on initialization
  }

  void fetchTransactions(String transactionType) async {
    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString("auth_token");

    if (authToken != null) {
      GetTransactionModel? response = await _transactionService.fetchTransactions(transactionType);

      if (response != null && response.status) {
        historeload.value=true;
        walletHistory.value = response.data.walletHistory;
        walletBalance.value = response.data.walletBalance;
        print(walletBalance.value);
        print('-----------------');
        print("Transaction Data: ${response.data.walletHistory}");
      } else {
        print("Error: ${response?.message ?? 'Unknown error'}");
      }
    } else {
      print("Error: Auth token not found");
    }
    historeload.value=false;







  }

  var ongoingOrders = <Order>[].obs; // List to hold ongoing orders
  final OngoingOrdersService _ongoingOrdersService = OngoingOrdersService();
  var ongoingload = true.obs;

  @override
  void onInitt() {
    super.onInit();
    fetchOngoingOrders("ongoing"); // Default to fetching ongoing orders on initialization
  }

  void fetchOngoingOrders(String type) async {
    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString("auth_token");

    if (authToken != null) {
      ongoingload.value = true; // Set loading to true
      GetOngoingOrders? response = await _ongoingOrdersService.fetchOngoingOrders(type);

      if (response != null && response.status) {
        ongoingOrders.value = response.data.orders; // Populate the ongoingOrders list
        print('Ongoing Orders: ${ongoingOrders.value}');
      } else {
        print("Error: ${response?.message ?? 'Unknown error'}");
      }
    } else {
      print("Error: Auth token not found");
    }
    ongoingload.value = false; // Set loading to false
  }
















    }

  



