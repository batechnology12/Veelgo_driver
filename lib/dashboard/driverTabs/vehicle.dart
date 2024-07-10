import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import '../../properties/common properties.dart';

class Vehicle extends StatefulWidget {
  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              _showModalBottomSheet(context);
            },
            child: Container(

              margin: EdgeInsets.only(bottom: 10),

              decoration:  BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(13)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 5, left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('05 May', style:inter1.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: SvgPicture.asset('assets/dolor.svg'),
                            ),
                            SizedBox(width: 3.w),
                            Text('\$65.5', style: inter1.copyWith(fontWeight: FontWeight.bold,fontSize: 13.sp,color: AppColors.dolorGreen)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '338C Anchorvale Cresent, 543338',
                                style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '4.00PM',
                                style: MyFonts.timebg,
                              ),
                            ],
                          ),
                          ksize15,
                          Padding(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Text(
                              '1 Stop',
                              style: inter1.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '338C Anchorvale Cresent, 543338',
                                style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '4.00PM',
                                style: MyFonts.timebg,
                              ),
                            ],
                          ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/truck.svg',
                          color: AppColors.white,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          'Car',
                          style: inter1.copyWith(fontWeight: FontWeight.w900,fontSize: 12.sp,color:Colors.white),
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
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet content can scroll
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            // height: 580.h,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Details',
                        style: poppins1.copyWith(fontSize: 16.sp,fontWeight: FontWeight.bold),
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
                  ksize2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Column(
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
                                Icon(
                                  Icons.circle,
                                  size: 17.sp,
                                  color: Colors.lightBlue,
                                ),
                                Dash(
                                  direction: Axis.vertical,
                                  length: 45.h,
                                  dashLength: 5,
                                  dashColor: AppColors.primaryColor,
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 20.sp,
                                  color: Color(0xffF74354),
                                ),
                              ],
                            ),
                          ),
                          wsize5,
                          wsize5,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pickup Details',
                                        style: poppinsBg,
                                      ),
                                      Container(
                                        width: 180.w,
                                        child: Text(
                                          '338C Anchorvale Cresent, 543338',
                                          style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivery Details',
                                        style: poppinsBg,
                                      ),
                                      SizedBox(width: 100.w),
                                      Container(
                                        width: 180.w,
                                        child: Text(
                                          '338C Anchorvale Cresent, 543338',
                                          style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 20.h),
                              SizedBox(height: 2.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivery Details',
                                        style: poppinsBg,
                                      ),
                                      SizedBox(width: 100.w),
                                      Container(
                                        width: 180.w,
                                        child: Text(
                                          '338C Anchorvale Cresent, 543338',
                                          style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 160.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '3pm to 4pm',
                              style: inter1.copyWith(fontSize: 11.sp,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '3pm to 4pm',
                              style: inter1.copyWith(fontSize: 11.sp,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '3pm to 4pm',
                              style: inter1.copyWith(fontSize: 11.sp,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ksize15,
                  ksize2,
                  Divider(
                    thickness: 1,
                  ),
                  ksize10,
                  Text('Remarks', style: poppinsBg),
                  ksize5,
                  Text(
                    'Call me before reaching and wait at lobby 6B',
                    style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.bold,color: AppColors.primaryColor),
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
                        '25*25*45 cm/5kg',
                        style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.bold),
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
                        'Amount',
                        style: inter1.copyWith(fontSize: 17.sp,fontWeight: FontWeight.bold,color: AppColors.bluegrey),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 3),
                            child: SvgPicture.asset('assets/walla.svg'),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '\$65.5',
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
                        // Set border color to primary color
                        borderRadius: BorderRadius.circular(50), // Adjust border radius as needed
                      ),
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(25), // Adjust border radius as needed
                        ),
                        child: SwipeButton(
                          height: 50.h,
                          width: 100.w,
                          thumbPadding: const EdgeInsets.all(3),
                          activeThumbColor: Colors.white, // Thumb color white
                          activeTrackColor: Color(0xffFFFFFF).withOpacity(0.16), // Slightly transparent track color
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
                            Navigator.pushNamed(context, '/map');
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
        );
      },
    );
  }
}