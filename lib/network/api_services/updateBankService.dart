import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../base_url.dart';

class UpdateBankAccount extends BaseApiServices{
  Future<void> updateBankDetails({
    required File bankProof,
    required String bankName,
    required String accountNumber,
    required String ifsCode,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString("auth_token");

    if (authtoken == null) {
      throw Exception('Token not found');
    }

    // API endpoint
     String url = UpdateAccountUrl;

    // Headers
    var headers = {
      'Authorization': 'Bearer $authtoken',
      'Content-Type': 'application/json',
    };

    // Prepare the image file
    var imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
    imageUploadRequest.headers.addAll(headers);
    imageUploadRequest.files.add(
      await http.MultipartFile.fromPath(
        'bank_proof', // API field name for the image
        bankProof.path,
      ),
    );

    // Other form data
    imageUploadRequest.fields['bank_name'] = bankName;
    imageUploadRequest.fields['account_number'] = accountNumber;
    imageUploadRequest.fields['ifs_code'] = ifsCode;

    // Send the request
    var streamedResponse = await imageUploadRequest.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      // Handle success response as needed
      return responseData;
    } else {
      // Handle error response
      throw Exception('Failed to update bank details: ${response.statusCode}');
    }
  }
}