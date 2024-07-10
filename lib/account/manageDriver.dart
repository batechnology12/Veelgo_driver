import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veelgo/account/updateDocuments/addDriverDoc.dart';
import 'package:veelgo/account/updateDocuments/driver_total_details.dart';

import '../properties/common properties.dart';

class ManageDriver extends StatefulWidget {
  const ManageDriver({super.key});

  @override
  State<ManageDriver> createState() => _ManageDriverState();
}

class _ManageDriverState extends State<ManageDriver> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new_outlined, size: 15.sp),
              ),
              Text(
                'Manage Driver',
                style: poppins1.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const UpdateDocuments());
                },

                  child: Text('Add driveer',style: inter1.copyWith(fontWeight: FontWeight.w700,fontSize: 14.sp,color: AppColors.primaryColor),))
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.to(DriverTotalDetails());
                
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 10,right: 10,bottom: 8),
                child: Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10),
                 ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Image.asset('assets/lee.png'),
                                  ),
                                ),
                                wsize10,
                                Container(
                                  width: 190.w,
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Lee wang',style: inter1.copyWith(fontSize: 16.sp,fontWeight: FontWeight.w700)),
                                      Text('Vehicle driver',style: inter1.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w700,color: AppColors.bluegrey)),
                                      ksize4,
                                      Row(
                                        children: [
                                          Icon(Icons.star,color: Colors.orange,),
                                          ksize5,
                                          Text('3.5',style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                      ksize4,
                                      Row(
                                        children: [
                                          Text('Vehicle No',style: inter1.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w700,color: AppColors.bluegrey)),
                                          wsize10,
                                          Text('GBL3245N',style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Vehicle No',style: inter1.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w700,color: AppColors.bluegrey)),
                                          wsize10,
                                          Text('2.4 Van',style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700)),
                                        ],
                                      ) ,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10,top: 10),
                              child: SizedBox(
                                  height: 18.h,
                                  width: 18.w,
                                  child: SvgPicture.asset('assets/edit.svg',)),
                            ),
                          ],
                        ),
                        ksize10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 35.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text('View Details',style: poppins.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.w700,fontSize: 13))),
                            ),
                            Container(
                              height: 35.h,
                              width: 100.w,

                              decoration: BoxDecoration(
                                color: AppColors.locoRed,

                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(child: Text('Block',style: poppins.copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)),
                            ),

                          ],
                        ),
                      ],

                    ),
                  ),

                ),
              ),
            );
          },
        ),
      ),
    );
  }
}