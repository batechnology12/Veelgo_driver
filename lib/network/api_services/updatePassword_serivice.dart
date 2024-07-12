import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../base_url.dart';

class PasswordService extends BaseApiServices {
  Future<bool> updatePassword(String password, String passwordConfirmation) async {
    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString("fpotp_token");

    final response = await http.post(
      Uri.parse(updatePasswordUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      body: jsonEncode({
        'password': password,
        'password_confirmation': passwordConfirmation,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['status'] == true;
    } else {
      throw Exception('Failed to update password');
    }

  }
}
