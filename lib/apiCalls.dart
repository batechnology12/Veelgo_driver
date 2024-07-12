import 'dart:convert';
import 'dart:io' as io;
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'modelClasses/notification_mc.dart';

class RegisterPersonolApi {
  final String baseUrl = 'https://veelgo.digitaldatatechnologia.in/api';

  Future<http.Response> register({
    required String type,
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String passwordConfirmation,
  }) async {
    final String url = '$baseUrl/register';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'type': type,
        'name': name,
        'email': email,
        'mobile': mobile,
        'password': password,
        'password_confirmation': passwordConfirmation,
      }),
    );
    return response;
  }
}

class RegisterFleetApi {
  final String baseUrl = 'https://veelgo.digitaldatatechnologia.in/api';

  Future<http.Response> register({
    required String type,
    required String companyName,
    required String name,
    required String businessEmail,
    required String mobile,
    required String password,
    required String passwordConfirmation,
  }) async {
    final String url = '$baseUrl/register';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'type': type,
        'name': name,
        'companyname': companyName,
        'business_email_id': businessEmail,
        'mobile': mobile,
        'password': password,
        'password_confirmation': passwordConfirmation,
      }),
    );
    return response;
  }


}

// class ForgotPasswordApi {
//   final String baseUrl = 'https://veelgo.digitaldatatechnologia.in/api';
//
//   Future<http.Response> forgotPassword({required String email}) async {
//     final String url = '$baseUrl/ForgetPassword';
//     final String? token = await getToken();
//
//     final response = await http.post(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         if (token != null) 'Authorization': 'Bearer $token',
//       },
//       body: jsonEncode(<String, String>{
//         'email': email,
//       }),
//     );
//
//     return response;
//   }
//
//   Future<String?> getToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('api_token');
//   }
// }

class LoginApi {
  final String baseUrl = 'https://veelgo.digitaldatatechnologia.in/api';

  Future<http.Response> login({
    required String email,
    required String password,
  }) async {
    final String url = '$baseUrl/login';
    print('Sending POST request to $url with email: $email'); // Debug log
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email_or_phone': email, // Ensure the key matches the API requirement
        'password': password,
      }),
    );

    print('Response status: ${response.statusCode}'); // Debug log
    print('Response body: ${response.body}'); // Debug log

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final token = responseData['data']['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
      print('Token: $token'); // Print the token
    }

    return response;
  }

}

// class forpass {
//   static const String baseUrl = 'https://veelgo.digitaldatatechnologia.in/api';
//
//   Future<Map<String, dynamic>> forgotPassword(String emailOrPhone) async {
//     try {
//       final String apiUrl = '$baseUrl/ForgetPassword';
//
//       final Map<String, String> body = {
//         'email_or_phone': emailOrPhone,
//       };
//
//       final http.Response response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json;',
//         },
//         body: jsonEncode(body),
//       );
//
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       throw Exception('Failed to connect to server. Please try again later.');
//     }
//   }
// }

// class ResetPassowrd {
//   final String baseUrl = 'https://veelgo.digitaldatatechnologia.in/api';
//
//   Future<http.Response> resetPassword({
//     required String email,
//     required String password,
//   }) async {
//     final String url = '$baseUrl/resetPassword';
//     print('Sending POST request to $url with email: $email'); // Debug log
//     final response = await http.post(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'email_or_phone': email, // Ensure the key matches the API requirement
//         'password': password,
//       }),
//     );
//
//     print('Response status: ${response.statusCode}'); // Debug log
//     print('Response body: ${response.body}'); // Debug log
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final responseData = jsonDecode(response.body);
//       print(responseData);
//
//     }
//
//     return response;
//   }
//
//
// }



class ApiService {
  static Future<List<Map<String, dynamic>>> fetchVehicleTypes() async {
    final apiUrl = 'https://veelgo.digitaldatatechnologia.in/api/vehicle_types';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];

        return jsonData.map((item) => {
          'id': item['id'].toString(),
          'name': item['name'].toString(),
          'description': item['description'].toString(),
        }).toList();
      } else {
        throw Exception('Failed to load vehicle types');
      }
    } catch (error) {
      print('Error fetching vehicle types: $error');
      return [];
    }
  }
}

class ProfileApi {
  final String baseUrl = 'https://veelgo.digitaldatatechnologia.in/api';
  final String updateProfilePictureEndpoint = '/update_profile_picture';

  Future<http.Response> updateProfilePicture({
    required String token,
    required PickedFile pickedFile, // Use PickedFile from image_picker
  }) async {
    final String url = '$baseUrl$updateProfilePictureEndpoint';

    try {
      // Determine MIME type
      final mimeTypeData = lookupMimeType(pickedFile.path)?.split('/');
      if (mimeTypeData == null || mimeTypeData.length != 2) {
        throw Exception('Failed to determine MIME type');
      }

      // Create request
      final request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers['Authorization'] = 'Bearer $token'
        ..files.add(await http.MultipartFile.fromPath(
          'profile_picture',
          pickedFile.path,
          contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
        ));

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          return response;
        } else {
          throw Exception('Failed to update profile picture: ${responseData['message']}');
        }
      } else {
        throw Exception('Failed to update profile picture: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating profile picture: $e');
    }
  }
}




