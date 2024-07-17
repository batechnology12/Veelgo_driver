import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../modelClasses/my_profile.dart';
import '../network/base_url.dart';


// class getBooking extends BaseApiServices

class GetBooking extends BaseApiServices {
  Future BookingOrderApi(String bookingtype) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      print(authtoken);
      print('-----------api token');

      var response = await dio.post(
        getBookingUrl,
        options: Options(
          headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },

            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }),
            data: {
               "booking_type": bookingtype, //all,parcel,vehicle
               // "max_distance": maxdistance,
               // "min_total_amount": mindistance,
               }
      );
        print(response.data);
      responseJson = response;
      print(responseJson);
      print('-----------');

    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

}
