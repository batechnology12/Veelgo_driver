import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../properties/common properties.dart';

class Cancelled extends StatefulWidget {
  const Cancelled({super.key});

  @override
  State<Cancelled> createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {

  final formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 6, // Number of items
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius:
              BorderRadius.circular(10),
            ),
            margin:
            const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Booking ID: #ZAGO1',style:inter1.copyWith(fontWeight: FontWeight.w800,fontSize: 15),),
                      Text('Ongoing',style: inter1.copyWith(fontWeight: FontWeight.w700,color: Colors.orange),),
                    ],),
                ),
                Divider(thickness: 1,endIndent: 1),
                ksize5,
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              bottom: 30),
                          child: Container(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 20.sp,
                                  color: const Color(
                                      0xff038484),
                                ),
                                Dash(
                                  direction:
                                  Axis.vertical,
                                  length: 50.h,
                                  dashLength: 5,
                                  dashColor: AppColors
                                      .primaryColor,
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 20.sp,
                                  color:
                                  const Color(0xffF74354),
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
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      'Pickup Details',
                                      style: poppinsBg,
                                    ),
                                    Container(
                                      width: 180.w,
                                      child: Text(
                                        '338C Anchorvale Cresent, 543338',
                                        style: addInter,
                                      ),
                                    ),
                                    ksize5,
                                    ksize2,
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      'Delivery Details',
                                      style: poppinsBg,
                                    ),
                                    SizedBox(
                                        width: 100.w),
                                    Container(
                                      width: 180.w,
                                      child: Text(
                                        '338C Anchorvale Cresent, 543338',
                                        style: addInter,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            ksize5,
                            ksize2,
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 120.h,
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceEvenly,
                        children: [
                          Text(
                            '3pm to 4pm',
                            style: MyFonts.interBG,
                          ),
                          ksize20,
                          Text(
                            '3pm to 4pm',
                            style: MyFonts.interBG,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height:43.h,
                  width:size.width,
                  decoration: BoxDecoration(
                      color: AppColors.lytRed,
                      borderRadius: BorderRadius.circular(12)


                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/clear.svg'),
                      wsize5,
                      Text('Cancel by Customer',style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.w700,color: AppColors.red),)
                    ],
                  ),
                ),
                ksize5,
              ],
            ),
          ),
        );
      },
    );
  }
}
