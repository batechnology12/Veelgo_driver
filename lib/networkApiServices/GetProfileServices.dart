import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modelClasses/my_profile.dart';
import '../network/base_url.dart';



class GetProfileServiceData extends BaseApiServices {

  Future getProfileApi() async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      print("------------------------------profile token-------------");
      print(authtoken);
      var response = await dio.get(
        getProfileData,
        options: Options(
            headers: {'Authorization': 'Bearer $authtoken'},
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }),
      );

      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

}