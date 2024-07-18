import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:veelgo/modelClasses/get_profile_model.dart';
import 'package:veelgo/service/Account_api_service.dart';

class AccounctScrrenaController extends GetxController {
  List<GetProfileData> getprofiledetalis = [];
  AccountApiAservice accountApiAservice = AccountApiAservice();

  void getprofile() async {
    dio.Response<dynamic> response = await accountApiAservice.getProfileApi();

    if (response.data["status"] == true) {
      Getprofilemodel getprofiledata = Getprofilemodel.fromJson(response.data);

      getprofiledetalis.clear();
      getprofiledetalis.add(getprofiledata.data);
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
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
