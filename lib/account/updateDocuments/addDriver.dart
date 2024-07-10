import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../commonClasses.dart';
import '../../properties/common properties.dart';

class AddDriver extends StatefulWidget {
  const AddDriver({super.key});

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  int selectedIndex = 0;
  String selectedValues = "+65";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nircController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add Driver',
            style: poppins1.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new_outlined, size: 15.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Upload Driver Picture',style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.w600,color:AppColors.primaryColor ),)
                    ],
                  ),
                  Text(
                    'NIRC full name',
                    style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  ksize4,
                  TextFieldBorder(
                    hintText: 'Enter your Name',
                    controller: nircController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validator: validateNRIC,
                  ),
                  ksize10,
                  ksize2,
                  Text(
                    'Phone Number',
                    style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  ksize4,
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
                  ),
                  ksize10,
                  ksize2,
                  Text(
                    'Email',
                    style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  ksize4,
                  TextFieldBorder(
                    hintText: 'Enter Email',
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validator: validateEmail,
                  ),
                  ksize10,
                  ksize2,
                  Text(
                    'Vehicle Type',
                    style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  ksize4,
                  TextFieldBorder(
                    hintText: 'Select Vehicle',
                    controller: vehicleController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validator: validateVechicle,
                  ),
                  ksize10,
                  ksize2,
                  Text(
                    'Vehicle Number',
                    style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  ksize4,
                  TextFieldBorder(
                    hintText: 'Enter Vehicle Number',
                    controller: vehicleNumberController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validator: validateVehicleNumbr,
                  ),
                  ksize10,
                  ksize2,
                  Text(
                    'New Password',
                    style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  ksize4,
                  TextFieldBorder(
                    hintText: 'Enter New Password',
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validator: validatePassword,
                  ),
                  ksize10 ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Training',style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.w600,color:AppColors.primaryColor ),),
                      Container(
                        decoration: BoxDecoration(
                            color:Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20)
                        ),

                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                          child: Text('Open',style: poppins1.copyWith(fontWeight: FontWeight.w900,fontSize: 12  .sp,color: AppColors.primaryColor),),
                        ),
                      )
                    ],
                  ),
                  ksize10 ,
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 1),
                    child: SizedBox(
                        height: 46.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            AddDriverSubmit(); // Call the function with the context
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
                                'Save',
                                style: inter1.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        )


                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
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
  String? validateNRIC(String? value) {
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
  String? validateVechicle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vehicle Name cannot be empty';
    }
    return null;
  }
  String? validateVehicleNumbr(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vehicle Number cannot be empty';
    }
    return null;
  }
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  Future<void> AddDriverSubmit() async {
    if (_formKey.currentState!.validate()) {


      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
      await Future.delayed(Duration(seconds: 3));
              Navigator.of(context).pop();
      Get.back();

      print('Form submitted successfully');
    } else {
      print('Form has validation errors. Cannot submit.');
    }
  }

}
