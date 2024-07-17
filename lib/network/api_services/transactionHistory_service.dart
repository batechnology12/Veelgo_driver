import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../modelClasses/transactionHistory.dart';
import '../base_url.dart';


class TransactionService extends BaseApiServices {
  final Dio _dio = Dio();

  Future<GetTransactionModel?> fetchTransactions(String transactionType) async {
    try {
      // Retrieve the token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      String? authToken = prefs.getString("auth_token");

      // API request body
      Map<String, dynamic> body = {
        "transaction_type": transactionType,
        // Add start_date and end_date if needed
      };

      // API request headers
      Map<String, dynamic> headers = {
        "Authorization": "Bearer $authToken",
        "Content-Type": "application/json",
      };

      // Make the API call
      Response response = await _dio.post(
        transactionHistoryUrl,
        data: body,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        return GetTransactionModel.fromJson(response.data);
      } else {
        // Handle error response
        print("Error: ${response.statusCode} - ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print("Exception: $e");
      return null;
    }
  }
}
