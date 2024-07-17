import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/network/base_url.dart';

import '../../modelClasses/my_earnings.dart';

class EarningsService extends BaseApiServices {
  final Dio _dio = Dio();


  String get getEarningsUrl => getEarningsUrl;

  Future<GetEarningModel> fetchEarnings(String startDate, String endDate) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final response = await _dio.post(
          getEarningsUrl,
          data: {
            "start_date": startDate,
            "end_date": endDate
          },
          options: Options(headers: {
            "Authorization": "Bearer $token"
          })
      );

      if (response.statusCode == 200) {
        return GetEarningModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load earnings data");
      }
    } catch (e) {
      throw Exception("Failed to load earnings data");
    }
  }
}
