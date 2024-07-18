import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:veelgo/controller/authController.dart';
import 'package:veelgo/controller/booking_controller.dart';
import '../../modelClasses/getDriverBookings.dart';
import '../../modelClasses/getDriverBookings.dart';
import '../../properties/common properties.dart';
import 'package:veelgo/dashboard/map/pickDrop_details.dart';
import 'package:http/http.dart' as http;

class AllScreen extends StatefulWidget {
  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  final AuthController authController = Get.put(AuthController());

  // Location location = Location();
  // late LocationData _currentPosition;
  // Timer? _timer;

  @override
  void initState() {
    super.initState();
    // _startPeriodicFetch();
  }

  // void _startPeriodicFetch() {
  //   // Start the periodic timer
  //   _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) => getData());
  // }

  // void _stopPeriodicFetch() {
  //   // Stop the periodic timer
  //   if (_timer != null) {
  //     _timer!.cancel();
  //     _timer = null;
  //   }
  // }

  // Future<void> getData() async {
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _currentPosition = await location.getLocation();

  //   if (_currentPosition != null) {
  //     print(
  //         "Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}");

  //     await bookingController.latestBooking(
  //       _currentPosition!.latitude.toString(),
  //       _currentPosition!.longitude.toString(),
  //     );
  //     // _showModalBottomSheet(context);
  //     // if (bookingController.status == true) {

  //     //   _stopPeriodicFetch();
  //     //   bookingController.status = false;
  //     // } else {
  //     //   Container();
  //     // }
  //   }
  // }
  // void getData() async {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     bool _serviceEnabled;
  //     PermissionStatus _permissionGranted;

  //     _serviceEnabled = await location.serviceEnabled();
  //     if (!_serviceEnabled) {
  //       _serviceEnabled = await location.requestService();
  //       if (!_serviceEnabled) {
  //         return;
  //       }
  //     }

  //     _permissionGranted = await location.hasPermission();
  //     if (_permissionGranted == PermissionStatus.denied) {
  //       _permissionGranted = await location.requestPermission();
  //       if (_permissionGranted != PermissionStatus.granted) {
  //         return;
  //       }
  //     }
  //     print(
  //         "--------------------lat long =========================================");
  //     print(_currentPosition.latitude.toString());
  //     print(_currentPosition.longitude.toString());
  //     _currentPosition = await location.getLocation();
  //     await bookingController.latestBooking(
  //       _currentPosition.latitude.toString(),
  //       _currentPosition.longitude.toString(),
  //     );
  //     if (bookingController.status == true) {
  //       _showModalBottomSheet(context);
  //       _stopPeriodicFetch();
  //       bookingController.status = false;
  //     } else {
  //       Container();
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _stopPeriodicFetch();
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // getData() async {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     bool _serviceEnabled;
  //     PermissionStatus _permissionGranted;

  //     _serviceEnabled = await location.serviceEnabled();
  //     if (!_serviceEnabled) {
  //       _serviceEnabled = await location.requestService();
  //       if (!_serviceEnabled) {
  //         return;
  //       }
  //     }

  //     _permissionGranted = await location.hasPermission();
  //     if (_permissionGranted == PermissionStatus.denied) {
  //       _permissionGranted = await location.requestPermission();
  //       if (_permissionGranted != PermissionStatus.granted) {
  //         return;
  //       }
  //     }

  //     _currentPosition = await location.getLocation();
  //     await bookingController.latestBooking(
  //       _currentPosition.latitude.toString(),
  //       _currentPosition.longitude.toString(),
  //     );
  //     if (bookingController.status == true) {
  //       _showModalBottomSheet(context);
  //     } else {
  //       Container();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return GetBuilder<AuthController>(builder: (_) {
      return authController.allOrders.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: authController.allOrders.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Datum userlistdata = authController.allOrders[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 12, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(userlistdata.id.toString(),
                                    style: inter1.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600)),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child:
                                          SvgPicture.asset('assets/dolor.svg'),
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(userlistdata.totalAmount.toString(),
                                        style: inter1.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.sp,
                                            color: AppColors.dolorGreen)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              thickness: 1,
                              color: Colors.blueGrey.shade300,
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 18),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xff038484),
                                    ),
                                    Dash(
                                      direction: Axis.vertical,
                                      length: 35,
                                      dashLength: 5,
                                      dashColor: AppColors.primaryColor,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.lightBlue,
                                    ),
                                    Dash(
                                      direction: Axis.vertical,
                                      length: 30,
                                      dashLength: 5,
                                      dashColor: AppColors.primaryColor,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xffF74354),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' ${userlistdata.fromAddress[0]['address']}',
                                        style: inter1.copyWith(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        ' ${userlistdata.fromAddress[0]['created_at']}',
                                        style: inter1.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.bluegrey),
                                      ),
                                    ],
                                  ),
                                  ksize15,
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2),
                                    child: Text(
                                      '1 Stop',
                                      style: inter1.copyWith(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    height: 50,
                                    width: 250, // Adjust the height as needed
                                    color: AppColors.white,
                                    child: ListView.builder(
                                      itemCount: userlistdata
                                          .bookingDeliveryAddresses.length,
                                      itemBuilder: (context, index) {
                                        BookingDeliveryAddress deliveryaddress =
                                            userlistdata
                                                    .bookingDeliveryAddresses[
                                                index];
                                        return Text(
                                          deliveryaddress.address,
                                          style: inter1.copyWith(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w700),
                                        );
                                      },
                                    ),
                                  ),
                                  ksize2,
                                ],
                              ),
                            ],
                          ),
                          ksize2,
                          Container(
                            height: 38.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(13),
                                bottomRight: Radius.circular(13),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/parcel.svg',
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      '5kg',
                                      style: inter1.copyWith(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: VerticalDivider(
                                    color: Colors.white,
                                    thickness: 2,
                                    width: 20,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/truck.svg',
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'Fast delivery',
                                      style: inter1.copyWith(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text("no data"),
            );
    });
  }
}
