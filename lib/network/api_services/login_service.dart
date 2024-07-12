import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_url.dart';

class LoginServicesApi extends BaseApiServices {
  dynamic responseData;
  Future<http.Response> login({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'email_or_phone': email, 'password': password}),
    );

    if (response.statusCode == 200 ||response.statusCode == 200) {
      final token = jsonDecode(response.body)['data']['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
    }
    responseData = response;
    return responseData;
  }
}
