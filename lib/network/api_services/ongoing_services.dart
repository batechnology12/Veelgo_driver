import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/network/base_url.dart';

import '../../modelClasses/ongoing_orders.dart'; // Adjust the import based on your model class

class OngoingOrdersService extends BaseApiServices {
 var dio = Dio();
  Future<dynamic> fetchOngoingOrders(String type) async {
    dynamic responseData;
    try {
      final prefs = await SharedPreferences.getInstance();
      String? authToken = prefs.getString("auth_token");

    
      Map<String, dynamic> headers = {
        "Authorization": "Bearer $authToken",
        "Content-Type": "application/json",
      };

      Response response = await dio.post(
        getOngoingOrdersUrl,
        
        options: Options(headers: headers,followRedirects: false,validateStatus: (status) {
          return status!<=500;
        },),
        data: {
           "type": type,
        },
      );
      responseData =response;
      return responseData;
      
    } catch (e) {
      print("Error fetching ongoing orders: $e");
      return null;
    }
  }
}
