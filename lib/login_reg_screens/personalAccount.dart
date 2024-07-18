import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/commonClasses.dart';
import '../apiCalls.dart';
import '../controller/authController.dart';
import '../network/controllers/auth_api_controllers.dart';
import '../properties/common properties.dart';
import '../personolOtp.dart';
import 'login.dart';
import 'otp.dart';


class PersonalAccountContent extends StatefulWidget {
  const PersonalAccountContent({super.key});

  @override
  State<PersonalAccountContent> createState() => _PersonalAccountContentState();
}

class _PersonalAccountContentState extends State<PersonalAccountContent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthControllers authController = Get.put(AuthControllers());

  int selectedIndex = 0;
  String selectedValues = "+65";


  bool _isChecked = false;
  bool _isPasswordVisible = false;

  void register() async {
    if (_formKey.currentState!.validate() && _isChecked) {
      final String name = _nameController.text.trim();
      final String email = _emailController.text.trim();
      final String mobile = _phoneController.text.trim();
      final String password = _passwordController.text.trim();

      // Call registration method from controller
      await authController.register(
        name: name,
        email: email,
        mobile: mobile,
        password: password,
        passwordConfirmation: password, // Assuming no confirmation field
      );
    } else {
      // Show validation error message or terms agreement message
     Get.snackbar('Error', 'Fill out the form correctly & agree to the terms');
    }
  }


  @override
  void dispose() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(
        ()=> authController.isLoading.isTrue ? Container(
          child: CircularProgressIndicator()):  Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name *', style: interMedi),
              ksize5,
              CustomTextFormField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              ksize15,
              Text('Email Id *', style: interMedi),
              const SizedBox(height: 5),
              CustomTextFormField(
                controller: _emailController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              ksize15,
              Text('Phone Number *', style: interMedi),
              ksize5,
              TextFormAddedNumbr(
                controller: _phoneController,
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
                            _phoneController.text = '';
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
              ksize15,
              Text('Password *', style: interMedi),
              ksize5,
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15),
                  filled: true, // Fill the background color
                  fillColor: Colors.grey[200], // Set the background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none, // Remove border
                  ),
                  focusedBorder: OutlineInputBorder(

                    // Customize focused border
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor, // Set indicator color
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
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                style:  TextStyle(fontSize: 17.sp),
                obscureText: !_isPasswordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              ksize10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  ksize5,
                  Flexible(
                    child: RichText(
                      text:  TextSpan(
                        text: 'I agree to allow my phone number to be used for calls or text regarding my application message and data rates may apply    ',
                        style: inter1.copyWith(
                          color: Colors.black54,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 1,
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
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ksize40,
              Center(
                child: SizedBox(
                  height: 47.h,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () => register(),
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
              ksize10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Already Have an Account ?',
                      style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.w700)
                  ),
                  ksize5,
                  GestureDetector(
                    onTap: () {
                     Get.offAll(const LoginPage());
                    },
                    child:  Text(
                      'Sign In',
                      style: inter1.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              ksize10,
            ],
          ),
        ),
        );



  }
}
