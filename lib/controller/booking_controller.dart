import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:veelgo/dashboard/map/pickDrop_details.dart';
import 'package:veelgo/dashboard/map/reachedLocation2.dart';
import 'package:veelgo/dashboard/paymentDetails/collectCash.dart';
import 'package:veelgo/modelClasses/Accept_booking_model.dart';
import 'package:veelgo/modelClasses/latest_booking_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:veelgo/properties/common%20properties.dart';
import 'package:veelgo/service/Account_api_service.dart';
import 'package:veelgo/service/booking_api_service.dart';

class BookingController extends GetxController {
  BookingApiservice BookingApiServices = BookingApiservice();

  List<LatestBookingData> latestBookingData = [];
  List<BookingDeliveryAddress> bookingaddress = [];
  List<BookingProduct> bookingprojects = [];
  List<AcceptBookingData> acceptbookingdatalist = [];
  RxBool latestBookingLoading = false.obs;
  RxBool accpeptloading = false.obs;
  RxBool conformloading = false.obs;

  latestBooking(String latitude, String longitude) async {
    latestBookingLoading(true);
    dio.Response<dynamic> response =
        await BookingApiServices.latestBooking(latitude, longitude);

    if (response.data["status"] == true) {
      GetLatestBookingModel getLatestBookingModel =
          GetLatestBookingModel.fromJson(response.data);
      latestBookingData = getLatestBookingModel.data;
      for (var bookingdatas in latestBookingData) {
        bookingaddress = bookingdatas.bookingDeliveryAddresses;
        bookingprojects = bookingdatas.bookingProducts;
      }

      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
    }
    latestBookingLoading(false);
  }

  void upadateloaction(
      {required String latitude, required String longitude}) async {
    dio.Response<dynamic> response = await BookingApiServices.updatelocation(
        latitude: latitude, Longitude: longitude);
    if (response.data["status"] == true) {
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
    }
  }

  void acceptbookingtask(
      {required String driverid, required String bookingid}) async {
    dio.Response<dynamic> response = await BookingApiServices.acceptbookingtask(
        driverid: driverid, bookingid: bookingid);

    if (response.data["status"] == true) {
      AcceptBookingdata acceptbookingdata =
          AcceptBookingdata.fromJson(response.data);
      acceptbookingdatalist.clear();
      acceptbookingdatalist.add(acceptbookingdata.data);
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
      Get.to(PickupDrop(
        acceptbookingdata: acceptbookingdatalist,
      ));
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
    }
  }

  void Conformpickup({
    required String bookingid,
    required String bookid,
    required String otp,
    required String pacakgeimage,
    required String pickuptime,
    required String droptime,
    required String amount,
    required String pickaddress,
    required String dropaddress,
  }) async {
    accpeptloading(true);
    update();
    dio.Response<dynamic> response = await BookingApiServices.conformpickup(
        bookingid: bookingid, otp: otp, packageimage: pacakgeimage);
    if (response.data["status"] == true) {
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
      Get.bottomSheet(
        isScrollControlled: true,
        LocationTwo(
          Bookingid: bookid,
          amount: amount,
          deververyaddress: dropaddress,
          pickaddress: pickaddress,
          derverytime: droptime,
          pickiuptime: pickuptime,
          bookid: bookingid,
        ),
        isDismissible: false,
        enableDrag: false,
      );

      accpeptloading(false);
      update();
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
      accpeptloading(false);
      update();
    }
  }

  void Conformdelivery({
    required String bookingid,
    required String bookid,
    required String otp,
    required List<File> pacakgeimage,
    required BuildContext context,
    // required String pickuptime,
    // required String droptime,
    // required String amount,
    required String pickaddress,
    required String dropaddress,
  }) async {
    conformloading(true);
    update();
    dio.Response<dynamic> response = await BookingApiServices.comformdelivery(
        bookingid: bookid, otp: otp, packageimage: pacakgeimage);
    if (response.data["status"] == true) {
      Get.rawSnackbar(
        backgroundColor: Colors.green,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );
      _successPop(context, pickaddress, dropaddress);
      conformloading(false);

      update();
    } else {
      // Get.bottomSheet(
      //   isScrollControlled: true,
      //   // LocationTwo(
      //   //   Bookingid: bookid,
      //   //   amount: amount,
      //   //   deververyaddress: dropaddress,
      //   //   pickaddress: pickaddress,
      //   //   derverytime: droptime,
      //   //   pickiuptime: pickuptime, bookid: bookingid,
      //   // ),
      //   isDismissible: false,
      //   enableDrag: false,
      // );

      Get.rawSnackbar(
        backgroundColor: Colors.red,
        messageText: Text(
          response.data['message'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      );

      conformloading(false);
      update();
    }
  }

  void _successPop(
      BuildContext context, String pickupaddress, String dropadresss) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent dismissing by tapping outside
      builder: (BuildContext context) {
        // Return the dialog
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/successtik.svg'),
                const SizedBox(height: 10),
                Text(
                  'Your message sent to admin.\nAdmin will contact you.',
                  textAlign: TextAlign.center,
                  style: poppinsBg,
                ),
              ],
            ),
          ),
        );
      },
    );

    // Delay navigation using Future.delayed
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Dismiss the dialog
      Get.to(PaymentDetails(
        dropaddress: pickupaddress,
        pickaddress: dropadresss,
      ));
    });
  }
}
