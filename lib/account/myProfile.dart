import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/controller/authController.dart';

import '../commonClasses.dart';
import '../controller/profile_controller.dart';
import '../modelClasses/my_profile.dart';
import '../network/controllers/auth_api_controllers.dart';
import '../properties/common properties.dart';

class AccountMyProfile extends StatefulWidget {
  const AccountMyProfile({super.key});

  @override
  State<AccountMyProfile> createState() => _AccountMyProfileState();
}

class _AccountMyProfileState extends State<AccountMyProfile> {
  AuthControllers profileController = Get.put(AuthControllers());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _isLoading = false;
  int selectedIndex = 0;
  String selectedValues = "+65";

  final AuthControllers editProfileController = Get.put(AuthControllers());

  @override
  void initState() {
    super.initState();
    getData();
    editProfileController.getProfile();
  }

  getData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await editProfileController.getProfileApi();
      await getProfileData();
      editProfileController.update();
    });
  }

  getProfileData() async {
    if (editProfileController.getUserData != null) {
      nameController.text = editProfileController.getUserData!.firstName;
      phoneController.text = editProfileController.getUserData!.phone;
      emailController.text = editProfileController.getUserData!.email;
      //  addressController.text = accountController.getUserData!.addresses;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'My Profile',
              style: poppins1.copyWith(
                  fontSize: 16.sp, fontWeight: FontWeight.w800),
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 120.h,
                              width: 100.w,
                            ),
                            CircleAvatar(
                              radius: 50.sp,
                              backgroundColor: Colors.grey,
                              child: Image.asset(
                                'assets/driverboy.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 7.5.sp,
                              left: (100.sp - 30.sp) / 2,
                              child: Container(
                                width: 30.sp,
                                height: 30.sp,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  radius: 15.sp,
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ksize10,
                    Text(
                      'Name',
                      style: inter1.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                    ksize5,
                    TextFieldBorder(
                      hintText: 'Enter your Name',
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      validator: validateName,
                    ),
                    ksize10,
                    Text(
                      'Phone Number',
                      style: inter1.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                    ksize5,
                    TextFieldBorder(
                      hintText: 'Enter your Number',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      validator: validatePhone,
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
                                  phoneController.text = '';
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
                    ),
                    ksize10,
                    Text(
                      'Email',
                      style: inter1.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                    ksize5,
                    TextFieldBorder(
                      hintText: 'Enter your Email',
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      validator: validateEmail,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 70.h,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SizedBox(
                    height: 46.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : handleSubmit,
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
                            'Submit',
                            style: inter1.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                          if (_isLoading)
                            Positioned(
                              right: 10, // Adjust position as needed
                              child: SizedBox(
                                height: 20.h,
                                width: 20.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation(
                                    AppColors.primaryColor,
                                  ),
                                  backgroundColor:
                                      AppColors.primaryColor.withOpacity(0.3),
                                  value: null,
                                  semanticsLabel: 'Loading',
                                ),
                              ),
                            ),
                        ],
                      ),
                    )),
              ),
            ),
          )),
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Simple email validation
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (selectedValues == "+65") {
      if (value == null || value.length != 8) {
        return 'Mobile number should be in 8 digits';
      }
    } else if (selectedValues == "+91") {
      if (value == null || value.length != 10) {
        return 'Mobile number should be in 10 digits';
      }
    }
    return null;
  }

  Future<void> handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      Get.to(AccountInfo(), arguments: {});
      setState(() {
        _isLoading = false;
      });
      // Clear controllers after submission

      print('Form submitted successfully');
    } else {
      print('Form has validation errors. Cannot submit.');
    }
  }
}

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final AuthControllers AccountInfoController = Get.put(AuthControllers());

  @override
  void initState() {
    super.initState();
    AccountInfoController.getProfile();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new_outlined, size: 19.sp),
              ),
              Text(
                'Account Info',
                style: poppins1.copyWith(
                    fontSize: 16.sp, fontWeight: FontWeight.w800),
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(const AccountMyProfile());
                  },
                  child: SvgPicture.asset('assets/edit.svg')),
            ],
          ),
        ),
        body: Obx(() {
          if (AccountInfoController.bankload.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.grey,
            ));
          } else if (AccountInfoController.getUserData == null) {
            return const Center(child: Text('No data available.'));
          } else {
            final userDatas = AccountInfoController.getUserData!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Stack(
                      children: [
                        Container(
                          height: 120.h,
                          width: 100.w,
                        ),
                        CircleAvatar(
                          radius: 50.sp,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            'assets/driverboy.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 7.5.sp,
                          left: (100.sp - 30.sp) / 2,
                          child: Container(
                            width: 30.sp,
                            height: 30.sp,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              radius: 15.sp,
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Name',
                    style: inter1.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  ksize5,
                  Text(
                    userDatas.firstName,
                    style: poppins2,
                  ),
                  ksize10,
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 5,
                  ),
                  Text(
                    'Phone Number',
                    style: inter1.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  ksize5,
                  Row(
                    children: [
                      Text(
                        userDatas.phone,
                        style: poppins2,
                      ),
                      wsize5,
                      wsize2,
                      Icon(
                        Icons.verified,
                        color: AppColors.dolorGreen,
                        size: 20.sp,
                      )
                    ],
                  ),
                  ksize10,
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 5,
                  ),
                  Text(
                    'Email Id',
                    style: inter1.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  ksize5,
                  Row(
                    children: [
                      Text(
                        userDatas.email,
                        style: poppins2,
                      ),
                      wsize5,
                      wsize2,
                      Icon(
                        Icons.verified,
                        color: AppColors.dolorGreen,
                        size: 20.sp,
                      )
                    ],
                  ),
                  ksize10,
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 5,
                  )
                ],
              ),
            );
          }
        }));
  }
}
