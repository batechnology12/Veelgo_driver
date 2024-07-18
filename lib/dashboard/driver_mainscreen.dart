import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:veelgo/controller/Account_screen_controller.dart';
import 'package:veelgo/controller/booking_controller.dart';
import 'package:veelgo/dashboard/map/pickDrop_details.dart';
import 'package:veelgo/modelClasses/latest_booking_model.dart';
import 'package:veelgo/properties/common%20properties.dart';
import 'package:veelgo/service/Account_api_service.dart';

import 'bottomFeatures/account.dart';
import 'bottomFeatures/home.dart';
import 'bottomFeatures/myOrder.dart';
import 'bottomFeatures/notofications.dart';
import 'bottomFeatures/wallet.dart';

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({Key? key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  int _selectedIndex = 2;
  // Initially selected index is 3 (zero-based index).

  bool status = false;
  Timer? timer;
  Location location = Location();
  LocationData? _currentPosition;
  final BookingController bookingController = Get.find<BookingController>();
  final AccounctScrrenaController accountscreenapi =
      Get.find<AccounctScrrenaController>();

  final List<Widget> _pages = [
    const MyOrder(),
    WalletPage(),
    HomeScreen(),
    NotificationPage(),
    AccountPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    // _startPeriodicFetch();
    accountscreenapi.getprofile();
    getData();
    super.initState();
  }

  void _startPeriodicFetch() {
    // Start the periodic timer
    timer = Timer.periodic(Duration(seconds: 2), (Timer timer) => getData());
  }

  Future<void> getData() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();

    if (_currentPosition != null) {
      print(
          "Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}");

      bookingController.upadateloaction(
          latitude: _currentPosition!.latitude.toString(),
          longitude: _currentPosition!.longitude.toString());

      await bookingController.latestBooking( 
        _currentPosition!.latitude.toString(),
        _currentPosition!.longitude.toString(),
      );

      if (bookingController.latestBookingData.isNotEmpty) {
        _showModalBottomSheet(context);
        timer?.cancel();
      } else {
        Container();
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: Center(
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/order.svg',
                color: _selectedIndex == 0
                    ? AppColors.primaryColor
                    : Colors.black54,
              ),
              label: 'My order',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/wallet.svg',
                color: _selectedIndex == 1
                    ? AppColors.primaryColor
                    : Colors.black54,
              ),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/home.svg',
                color: _selectedIndex == 2
                    ? AppColors.primaryColor
                    : Colors.black54,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 23.h,
                child: SvgPicture.asset(
                  'assets/noti.svg',
                  color: _selectedIndex == 3
                      ? AppColors.primaryColor
                      : Colors.black54,
                ),
              ),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/profile.svg',
                color: _selectedIndex == 4
                    ? AppColors.primaryColor
                    : Colors.black54,
              ),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedFontSize: 12,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold, // Make selected label bold
          ), // Adjust the font size here
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500, // Make selected label bold
          ), // Adjust the font size here
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      useSafeArea: false,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            _startPeriodicFetch();
            return false;
          },
          child: DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.3,
            maxChildSize: 0.7,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return GetBuilder<BookingController>(
                builder: (_) => SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    // padding: EdgeInsets.only(
                    //   bottom: MediaQuery.of(context).viewInsets.bottom,
                    // ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ksize20,
                          for (var bookingaddress
                              in bookingController.bookingaddress)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 150),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                ),
                                height: 4,
                              ),
                            ),
                          ksize15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Orders Details',
                                style: poppins1.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  height: 20.h,
                                  width: 20.h,
                                  child: Image.asset('assets/loaderpng.png')),
                            ],
                          ),
                          ksize10,
                          Divider(
                            thickness: 1,
                          ),
                          ksize15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 20.sp,
                                    color: const Color(0xff038484),
                                  ),
                                  Dash(
                                    direction: Axis.vertical,
                                    length: 58.h,
                                    dashLength: 5,
                                    dashColor: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pickup Details',
                                    style: poppinsBg,
                                  ),
                                  Container(
                                    width: 180.w,
                                    child: Text(
                                      bookingController.latestBookingData.first
                                          .pickupaddress,
                                      style: inter1.copyWith(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                              ),
                              Text(
                                "${bookingController.bookingprojects.first.deliverytimeFrom} to ${bookingController.bookingprojects.first.deliverytimeTo}",
                                style: inter1.copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          ksize2,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: bookingController.bookingaddress.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              BookingDeliveryAddress lastbookinglist =
                                  bookingController.bookingaddress[index];
                              BookingProduct lastbookingproject =
                                  bookingController.bookingprojects[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 20.sp,
                                        color: const Color(0xff038484),
                                      ),
                                      Dash(
                                        direction: Axis.vertical,
                                        length: 58.h,
                                        dashLength: 5,
                                        dashColor: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivery Details',
                                        style: poppinsBg,
                                      ),
                                      Container(
                                        width: 180.w,
                                        child: Text(
                                          lastbookinglist.address,
                                          style: inter1.copyWith(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                  Text(
                                    "${lastbookingproject.pickuptimeFrom} to ${lastbookingproject.deliverytimeTo}",
                                    style: inter1.copyWith(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              );
                            },
                          ),
                          ksize15,
                          Divider(
                            thickness: 1,
                          ),
                          ksize10,
                          Text('Remarks', style: poppinsBg),
                          ksize5,
                          Text(
                            'Call me before reaching and wait at lobby 6B',
                            style: inter1.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                          ksize10,
                          Divider(
                            thickness: 1,
                          ),
                          ksize10,
                          Text('Delivery Type', style: poppinsBg),
                          ksize5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${bookingController.bookingprojects.first.length}*${bookingController.bookingprojects.first.length}*${bookingController.bookingprojects.first.height} cm/${bookingController.bookingprojects.first.kg}',
                                style: inter1.copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/boxx.svg',
                                        color: AppColors.bluegrey,
                                      ),
                                      wsize5,
                                      Text(
                                        'No of Parcel  2',
                                        style: poppinsBg,
                                      ),
                                    ],
                                  ),
                                  ksize5,
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/truckbg.svg',
                                        color: AppColors.bluegrey,
                                      ),
                                      wsize5,
                                      Text(
                                        'Fast Delivery',
                                        style: poppinsBg,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          ksize10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Amount",
                                style: inter1.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.bluegrey),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 3),
                                    child: SvgPicture.asset('assets/walla.svg'),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '\$${bookingController.latestBookingData.first.totalAmount}',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.dolorGreen),
                                  ),
                                  wsize5,
                                  SvgPicture.asset('assets/i.svg'),
                                ],
                              ),
                            ],
                          ),
                          ksize15,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                height: 50.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: SwipeButton(
                                  height: 50.h,
                                  width: 100.w,
                                  thumbPadding: const EdgeInsets.all(3),
                                  activeThumbColor: Colors.white,
                                  activeTrackColor:
                                      Color(0xffFFFFFF).withOpacity(0.16),
                                  thumb: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.double_arrow,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  onSwipe: () {
                                    bookingController.acceptbookingtask(
                                        driverid: accountscreenapi
                                            .getprofiledetalis.first.id
                                            .toString(),
                                        bookingid: bookingController
                                            .latestBookingData.first.id
                                            .toString());
                                  },
                                  child: Text(
                                    "Accept your task",
                                    style: inter1.copyWith(
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ksize10,
                          GestureDetector(
                            onTap: () {
                              _startPeriodicFetch();
                              Navigator.pop(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cancel Task',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                )
                              ],
                            ),
                          ),
                          ksize10,
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}



 // Column(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [
                                        //         Text(
                                        //          ,
                                        //           style: poppinsBg,
                                        //         ),
                                        //         SizedBox(width: 100.w),
                                        //         Container(
                                        //           width: 180.w,
                                        //           child: Text(
                                        //             '338C Anchorvale Cresent, 543338',
                                        //             style: inter1.copyWith(
                                        //                 fontSize: 13.sp,
                                        //                 fontWeight:
                                        //                     FontWeight.bold),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     )
                                        //   ],
                                        // ),
                                        // SizedBox(height: 20.h),
                                        // SizedBox(height: 2.h),
                                        // Column(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [
                                        //         Text(
                                        //           'Delivery Details',
                                        //           style: poppinsBg,
                                        //         ),
                                        //         SizedBox(width: 100.w),
                                        //         Container(
                                        //           width: 180.w,
                                        //           child: Text(
                                        //             bookingController
                                        //                 .latestBookingData[
                                        //                     index]
                                        //                 .bookingDeliveryAddresses
                                        //                 .first
                                        //                 .address,
                                        //             style: inter1.copyWith(
                                        //                 fontSize: 13.sp,
                                        //                 fontWeight:
                                        //                     FontWeight.bold),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     )
                                        //   ],
                                        // ),




                                        
                                  //  Column(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [

                                  //     // Text(
                                  //     //   '3pm to 4pm',
                                  //     //   style: inter1.copyWith(
                                  //     //       fontSize: 11.sp,
                                  //     //       fontWeight: FontWeight.bold),
                                  //     // ),
                                  //     // Text(
                                  //     //   "${bookingController.latestBookingData[index].bookingProducts.first.deliverytimeFrom} to ${bookingController.latestBookingData[index].bookingProducts.first.deliverytimeTo}",
                                  //     //   style: inter1.copyWith(
                                  //     //       fontSize: 11.sp,
                                  //     //       fontWeight: FontWeight.bold),
                                  //     // ),
                                  //   ],
                                  // ),