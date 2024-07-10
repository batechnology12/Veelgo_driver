import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:veelgo/modelClasses/getDriverBookings.dart';
import '../modelClasses/faq_services.dart';
import '../networkApiServices/GetApi.dart';
import '../networkApiServices/faqApiService.dart';


class AuthController extends GetxController {
  RxInt containerIndex = 0.obs;

  GetBooking getBookingService = GetBooking();
  List<Datum> allOrders = <Datum> [].obs;
  RxBool allOrdersLoading = false.obs;

  AllOrder(String bookingtype,String maxdistance,String mindistance,) async {

    allOrdersLoading(true);
    dio.Response<dynamic> response = await getBookingService.BookingOrderApi(bookingtype,maxdistance,mindistance);
    allOrdersLoading(false);

    if (response.data["status"] == true) {
      print(response.data);
      print('---------------------status');
      DriverBookings getBookingOrdersModel = DriverBookings.fromJson(response.data);
      allOrders = getBookingOrdersModel.data;
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

  // FaqApiService faqServices= FaqApiService();
  // faqDatas()async{
  //   List<FaqData> faqdatalist = [];
  //   dio.Response<dynamic> response =await faqServices.FaqApi();
  //   if (response.data["status"] == true) {
  //     print(response.data);
  //     print('---------------------status');
  //    FaqServices faqServices = FaqServices.fromJson(response.data);
  //     faqdatalist = faqServices.data;
  //     update();
  //   } else {
  //     Get.rawSnackbar(
  //       backgroundColor: Colors.red,
  //       messageText: Text(
  //         response.data['message'],
  //         style: TextStyle(color: Colors.white, fontSize: 15.sp),
  //       ),
  //     );
  //   }
  //
  // }

}
