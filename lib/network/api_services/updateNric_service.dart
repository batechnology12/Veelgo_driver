import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/login_reg_screens/PersonalDoc.dart';

import '../base_url.dart';

class NricService extends BaseApiServices{

  Future<String?> uploadNricPicture(File image) async {
    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString("auth_token");

    if (authToken == null) {
      throw Exception('Token not found');
    }
    String url = updateNricUrl;
    print('------------------');
    print(url);
    print(Uri.parse(url));
    var headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'multipart/form-data',
    };

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll(headers)
      ..files.add( await http.MultipartFile.fromPath('nric_picture', image.path));
      print(image.path);
    print('-----------------');
      // ..files.add(await );

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var decodedData= jsonDecode(responseData);
      return decodedData['data']['nric_picture_url'];


    } else {
      print('Failed to upload NRIC picture: ${response.statusCode}');

    }
  }
}
