import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/networkApiServices/baseUrl.dart';
import 'package:http_parser/http_parser.dart';

class BookingApiservice extends BaseApiServices {
  Future latestBooking(String latitude, String longitude) async {
    dynamic responsonJson;

    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");

      var response = await dio.post(latestBookingUrl,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $authtoken'
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          data: {
            "latitude": latitude,
            "longitude": longitude,
          });
      responsonJson = response;
    } on SocketException {
      print("No internet");
    }
    return responsonJson;
  }

  Future<dynamic> acceptbookingtask(
      {required String driverid, required String bookingid}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      print(authtoken);
      print('-----------api token');
      var response = await dio.post(acceptBookingUrl,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "driver_id": driverid,
            "booking_id": bookingid,
          });
      print(response.data);
      responseJson = response;
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> updatelocation(
      {required String latitude, required String Longitude}) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      print(authtoken);
      print('-----------api token');

      var response = await dio.post(locationupdateapi,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "latitude": latitude,
            "longitude": Longitude,
          });
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  Future<dynamic> conformpickup({
    required String bookingid,
    required String otp,
    required String packageimage,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      print(authtoken);
      print('-----------api token');
      // Convert the list of images to MultipartFile
      // List<MultipartFile> multipartImageList = [];

      // multipartImageList.add(await MultipartFile.fromFile(
      //   packageimage,
      //   filename: packageimage.split('/').last,
      //   contentType: MediaType("image", "jpeg"),
      // ));

      // Create the form data
      FormData formData = FormData.fromMap({
        "booking_id": bookingid,
        "otp": otp,
        "package_pictures[]": [
          MultipartFile.fromFileSync(packageimage,
              filename: packageimage.split('/').last)
        ]
      });
      var response = await dio.post(conformpickupurl,
          options: Options(
              headers: {
                'Content-Type': "multipart/form-data",
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print(response.data);
      responseJson = response;
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> comformdelivery({
    required String bookingid,
    required String otp,
    required List<File> packageimage,
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      print(authtoken);
      print('-----------api token');

      FormData formData = FormData.fromMap({
        "booking_id": bookingid,
        "otp": otp,
        "package_pictures[]": MultipartFile.fromFileSync(
            packageimage.first.path,
            filename: packageimage.first.path.split('/').last)
      });
      var response = await dio.post(conformdeliveryoderurl,
          options: Options(
              headers: {
                'Content-Type': "multipart/form-data",
                'Authorization': 'Bearer $authtoken'
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print(response.data);
      responseJson = response;
    } catch (e) {
      print(e);
    }
    return responseJson;
  }
}
