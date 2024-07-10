import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'baseUrl.dart';

// class getBooking extends BaseApiServices

class FaqApiService extends BaseApiServices {


  Future FaqApi() async {
    dynamic responseJson;
    try {
      var dio = Dio();
      // final prefs = await SharedPreferences.getInstance();
      // String? authtoken = prefs.getString("auth_token");
      // print(authtoken);
      // print('-----------api token');

      var response = await dio.get(
          faqUrl,
          options: Options(
              // headers: {
              //   'Content-Type': 'application/json',
              //   // 'Authorization': 'Bearer $authtoken'
              // },

              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          // data: {
          //   "booking_type": bookingtype, //all,parcel,vehicle
          //   "max_distance": maxdistance,
          //   "min_total_amount": mindistance,
          // }
      );
      print(response.data);
      responseJson = response;
      print(responseJson);
      print('-----------');
      print('-----------');
      print('-----------');
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }



}