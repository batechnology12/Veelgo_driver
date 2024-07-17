import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/network/base_url.dart';

import '../../modelClasses/ongoing_orders.dart'; // Adjust the import based on your model class

class OngoingOrdersService extends BaseApiServices {
  final Dio _dio = Dio();

  Future<dynamic> fetchOngoingOrders(String type ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? authToken = prefs.getString("auth_token");

      Map<String, dynamic> body = {
        "type": type,
        // Add start_date and end_date if needed
      };

      Map<String, dynamic> headers = {
        "Authorization": "Bearer $authToken",
        "Content-Type": "application/json",
      };

      Response response = await _dio.post(
        getOngoingOrdersUrl,
        data: body,
        options: Options(headers: headers),
      );
return response;
      // if (response.statusCode == 200) {
      //   return GetOngoingOrders.fromJson(response.data);
      // } else {
      //   // Handle other status codes
      //   print("Error: ${response.statusCode} - ${response.statusMessage}");
      //   return null;
      // }
    } catch (e) {
      print("Error fetching ongoing orders: $e");
      return null;
    }
  }
}
