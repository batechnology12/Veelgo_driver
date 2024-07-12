import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_url.dart';

class updatePersonolProfile extends BaseApiServices {
  Future<String?> updateProfilePicture(File imageFile) async {
    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString("auth_token");

    if (authToken == null) {
      throw Exception('Token not found');
    }

    var headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'multipart/form-data',
    };

    var request = http.MultipartRequest('POST', Uri.parse(profileUrl))
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var decodedData = jsonDecode(responseData);
      return decodedData['data']['profile_picture_url'];


    } else {
      throw Exception('Failed to upload profile picture: ${response.statusCode}');
    }
  }

}