import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../modelClasses/my_profile.dart';

import '../networkApiServices/GetProfileServices.dart';


import 'package:dio/dio.dart' as dio;




class ProfileController extends GetxController {

  GetProfileServiceData profileApiServices = GetProfileServiceData();
  UserData? getUserData;
  RxBool imageLoading = false.obs;
  getProfile() async {
    update();
    dio.Response<dynamic> response =  await profileApiServices.getProfileApi();
    update();
    print("------profile token--------------------------");
    print(response.data);
    if (response.data["status"] == true) {
      GetUserModel getUserModel = GetUserModel.fromJson(response.data);
      getUserData = getUserModel.data.user;
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
      update();
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
    }
  }

}
