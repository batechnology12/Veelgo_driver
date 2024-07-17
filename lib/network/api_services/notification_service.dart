import 'dart:io';


import 'package:dio/dio.dart'as dio;
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modelClasses/notification_model.dart';
import '../base_url.dart';

class NotificationApiService extends BaseApiServices {
  Future<dynamic>notificationApi() async {
    try {
      final dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      final response = await dio.get(
        notificationUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $authtoken'},
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      return response;
    } on SocketException {
      throw Exception("No internet connection");
    } catch (e) {
      throw Exception("Failed to fetch notifications: $e");
    }
  }
}