import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../properties/common properties.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  final formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
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
                const Divider(thickness: 1,endIndent: 1),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height:50.h,
                        width:147.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          border: Border.all(width: 1,color: Colors.grey.shade400),// Background color of the container
                          borderRadius: BorderRadius.circular(15), // Adjust the value for more or less rounding
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Earned',style: inter1.copyWith(color: AppColors.dolorGreen,fontSize: 13.sp,fontWeight: FontWeight.w700),),
                            wsize5,
                            Text('\$65.5',style: inter1.copyWith(color: AppColors.dolorGreen,fontWeight: FontWeight.bold,fontSize: 13.sp),),


                          ],
                        ) // Add your child widgets here
                    ),
                    Container(
                        height:50.h,
                        width:145.w,
                        decoration: BoxDecoration(
                          color: Colors.green.shade600, // Background color of the container
                          borderRadius: BorderRadius.circular(15), // Adjust the value for more or less rounding
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.verified,color: Colors.white,),
                            wsize5,
                            Text('Compleated',style: inter1.copyWith(color: AppColors.white,fontWeight: FontWeight.w800,fontSize: 13),),


                          ],
                        ) // Add your child widgets here
                    ),

                  ],
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
