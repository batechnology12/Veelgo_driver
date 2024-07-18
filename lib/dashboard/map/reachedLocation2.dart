import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../properties/common properties.dart';
import '../deliveryProof/confirmDelivery.dart';

class LocationTwo extends StatefulWidget {
  String pickaddress;
  String deververyaddress;
  String amount;
  String Bookingid;
  String pickiuptime;
  String derverytime;
  String bookid;
  LocationTwo(
      {super.key,
      required this.Bookingid,
      required this.amount,
      required this.deververyaddress,
      required this.pickaddress,
      required this.derverytime,
      required this.pickiuptime,
      required this.bookid});

  @override
  State<LocationTwo> createState() => _LocationTwoState();
}

class _LocationTwoState extends State<LocationTwo> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return Wrap(
      children: [
        Container(
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
              mainAxisSize: MainAxisSize.min, // Add this line
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ksize10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    height: 4.h,
                  ),
                ),
                ksize10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ongoing Order',
                        style: inter1.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 17.sp,
                            color: Colors.black)),
                    Text('30 minuts away from destination',
                        style: inter1.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 13.sp,
                            color: AppColors.teal)),
                  ],
                ),
                ksize10,
                Center(
                  child: Container(
                    height: 38.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(
                          8), // Adjust the value as needed
                    ),
                    child: Center(
                      child: AutoSizeText('Booking Id : ${widget.Bookingid}',
                          maxLines: 1,
                          style: inter1.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.black)),
                    ),
                  ),
                ),
                ksize10,
                Container(
                  height: 260.h,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.09),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 20.sp,
                                            color: const Color(0xff038484),
                                          ),
                                          Dash(
                                            direction: Axis.vertical,
                                            length: 110.h,
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
                                  ),
                                  wsize5,
                                  wsize5,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  widget.pickaddress,
                                                  style: inter1.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13.sp),
                                                ),
                                              ),
                                              ksize5,
                                              ksize2,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.phone,
                                                        size: 12.sp,
                                                      ),
                                                      Text(
                                                        'Call',
                                                        style:
                                                            poppins1.copyWith(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black),
                                                      )
                                                    ],
                                                  ),
                                                  wsize10,
                                                  wsize10,
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.message,
                                                        size: 12.sp,
                                                      ),
                                                      wsize2,
                                                      Text(
                                                        'Message',
                                                        style:
                                                            poppins1.copyWith(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      SizedBox(height: 2.h),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  widget.deververyaddress,
                                                  style: addInter,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      ksize5,
                                      ksize2,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                size: 12.sp,
                                              ),
                                              Text(
                                                'Call',
                                                style: poppins1.copyWith(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                          wsize10,
                                          wsize10,
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.message,
                                                size: 12.sp,
                                              ),
                                              wsize2,
                                              Text(
                                                'Message',
                                                style: poppins1.copyWith(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 175.h,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.pickiuptime} to ${widget.derverytime}',
                                          style: MyFonts.interBG,
                                        ),
                                        ksize20,
                                        SizedBox(
                                            height: 12.h,
                                            child: SvgPicture.asset(
                                                'assets/arrow.svg')),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.pickiuptime} to ${widget.derverytime}',
                                          style: MyFonts.interBG,
                                        ),
                                        ksize20,
                                        SizedBox(
                                            height: 12.h,
                                            child: SvgPicture.asset(
                                                'assets/arrow.svg')),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                ksize10,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  'Remarks',
                  style: poppinsBg,
                ),
                ksize5,
                Text(
                  'Call me before reacing and wait at lobby 6B',
                  style: inter1.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                ksize10,
                ksize5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount',
                      style: inter1.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: AppColors.bluegrey),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 3),
                          child: SvgPicture.asset('assets/dolor.svg'),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '\$${widget.amount}',
                          style: inter1.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: AppColors.dolorGreen),
                        ),
                        wsize10,
                        SizedBox(
                          height: 20.h,
                          child: GestureDetector(
                            onTap: () {
                              showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                barrierLabel: MaterialLocalizations.of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: Colors.black45,
                                transitionDuration: Duration(milliseconds: 200),
                                pageBuilder: (BuildContext buildContext,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return Container();
                                },
                                transitionBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return ScaleTransition(
                                    scale: CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeOut,
                                    ),
                                    child: Align(
                                      alignment: Alignment
                                          .topLeft, // Adjust alignment to position the dialog
                                      child: Transform.translate(
                                        offset: const Offset(50,
                                            200), // Adjust this offset to position the dialog
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: AlertDialog(
                                            title: Text('Title'),
                                            content: Text(
                                                'This is a simple dialog.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Close'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: SizedBox(
                                height: 14.h,
                                child: SvgPicture.asset('assets/i.svg')),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ksize10,
                Center(
                  child: SizedBox(
                    height: 46.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(ConfirmDelivery(
                          dropadress: widget.deververyaddress,
                          bookingid: widget.Bookingid,
                          bookid: widget.bookid,
                          deververyaddress: widget.pickaddress,
                          pickaddress: widget.deververyaddress,
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor, // Change button color

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Reached Location',
                        style: inter1.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                ksize10,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
