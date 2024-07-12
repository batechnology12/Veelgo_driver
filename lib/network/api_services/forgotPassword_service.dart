import 'package:get/get.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;
import '../base_url.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
 // Adjust this import according to your project structure

class ForgotPasswordService extends BaseApiServices {
  Future<Map<String, dynamic>?> forgotPassword(String emailOrPhone) async {
    final String apiUrl = forgotPasswordUrl;

    final Map<String, dynamic> body = {
      'email_or_phone': emailOrPhone,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('-------forgotpassword-success---------');
        return jsonDecode(response.body);
      } else {

        return null;
      }
    } catch (e) {
      Get.snackbar('', 'Error, please try again');
      return null;
    }
  }
}

