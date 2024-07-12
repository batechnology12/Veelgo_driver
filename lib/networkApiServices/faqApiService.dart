import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../network/base_url.dart';


// class getBooking extends BaseApiServices

class FaqApiService extends BaseApiServices {


  Future FaqApi() async {
    dynamic responseJson;
    try {
      var dio = Dio();

      var response = await dio.get(
          faqUrl,
          options: Options(

              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
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







