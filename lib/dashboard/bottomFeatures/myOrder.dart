import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/authController.dart';
import '../../properties/common properties.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final authController = Get.put(AuthController());
  bool ischeck = false;

  bool ishide = false;
  bool confirnhide = false;
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
  var emailController = TextEditingController();

  bool ischecked = false;

  bool ishiding = false;
  bool confirmhide = false;

  var companynameController = TextEditingController();
  var businessphoneController = TextEditingController();
  var businessemailidController = TextEditingController();
  var contactPersonController = TextEditingController();
  var industryController = TextEditingController();
  var parcelController = TextEditingController();
  var businnesspasswordsController = TextEditingController();
  var bussinessConfirmpasswordsController = TextEditingController();

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lytBlue,
      body: Container(
          width: double.infinity,
          height: size.height,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade100,
                Colors.grey.shade100,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Obx(() => Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.16,
                        decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17))),
                        child: Center(child: Text('Assigning Task',style: inter1.copyWith(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 17.sp),),),
                      ),
                      Expanded(
                          //  flex: 4,
                          child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                offset: Offset(0.00, 0.80),
                                color: AppColors.primaryColor)
                          ],
                          color: Colors.grey.shade100,
                        ),
                      ))
                    ],
                  ),
                  ksize10,
                  if (authController.containerIndex.value == 0)
                    Form(
                      key: formKey1,
                      child: Positioned(
                        top: 160.h,
                        left: 10,
                        right: 10,
                        child: Container(
                          height: 700,

                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                           scrollDirection: Axis.vertical,
                            itemCount: 6, // Number of items
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:10,right: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Booking ID: #ZAGO1',style: inter1.copyWith(fontWeight: FontWeight.w800,fontSize: 15),),
                                          Text('Ongoing',style: inter1.copyWith(fontWeight: FontWeight.w700,color: Colors.orange),),
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 1,endIndent: 1),
                                    ksize5,
                                    Row(
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
                                                      length: 50.h,
                                                      dashLength: 5,
                                                      dashColor: AppColors.primaryColor,
                                                    ),
                                                    Icon(
                                                      Icons.location_on,
                                                      size: 20.sp,
                                                      color: const Color(0xffF74354),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            wsize5,
                                            wsize5,
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                            MainAxisAlignment.spaceEvenly,
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
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                    ),
                  if (authController.containerIndex.value == 1)
                    Form(
                      key: formKey2,
                      child: Positioned(
                          top: 160.h,
                          left: 10,
                          right: 10,
                          child: Container(
                            height: size.height - 130,
                            child:  ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: 6, // Number of items
                              itemBuilder: (context, index) {
                                return Container(
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
                                );
                              },
                            ),
                          )),
                    ),
                  if (authController.containerIndex.value == 2)
                    Form(
                      key: formKey3,
                      child: Positioned(
                          top: 160.h,
                          left: 10,
                          right: 10,
                          child: Container(
                            color: Colors.white,
                            height: size.height - 130,
                            child:  ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: 6, // Number of items
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.40,color: Colors.grey),
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
                                );
                              },
                            ),
                          )),
                    ),
                  Positioned(
                    top: size.height * .13,
                    left: 13,
                    right: 13,
                    child: Container(
                      height: 45.h,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            wsize2,
                            InkWell(
                              onTap: () {
                                authController.containerIndex(0);
                                authController.update();
                              },
                              child: Container(
                                height: 35.h,
                                width: 97.w,
                                decoration: BoxDecoration(
                                    color:
                                        authController.containerIndex.value == 0
                                            ? AppColors.primaryColor
                                            : Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text(
                                  'Ongoing',
                                  style: inter1.copyWith(
                                      color:
                                          authController.containerIndex.value ==
                                                  0
                                              ? AppColors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                authController.containerIndex(1);
                                authController.update();
                              },
                              child: Container(
                                height: 35.h,
                                width: 97.w,
                                decoration: BoxDecoration(
                                    color:
                                        authController.containerIndex.value == 1
                                            ? AppColors.primaryColor
                                            : Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text(
                                  'Completed',
                                  style: inter1.copyWith(
                                      color:
                                          authController.containerIndex.value ==
                                                  1
                                              ? AppColors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp),
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                authController.containerIndex(2);
                                authController.update();
                              },
                              child: Container(
                                height: 35.h,
                                width: 97.w,
                                decoration: BoxDecoration(
                                    color:
                                        authController.containerIndex.value == 2
                                            ? AppColors.primaryColor
                                            : Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text(
                                  'Cancelled',
                                  style: inter1.copyWith(
                                      color:
                                          authController.containerIndex.value ==
                                                  2
                                              ? AppColors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp),
                                )),
                              ),
                            ),
                            wsize2,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}



