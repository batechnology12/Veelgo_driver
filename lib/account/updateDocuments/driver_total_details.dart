import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../properties/common properties.dart';
import 'addDriverDoc.dart';

class DriverTotalDetails extends StatefulWidget {
  const DriverTotalDetails({super.key});

  @override
  State<DriverTotalDetails> createState() => _DriverTotalDetailsState();
}

class _DriverTotalDetailsState extends State<DriverTotalDetails> {
  var nunito = GoogleFonts.nunito(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.bold
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

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
                'Leewang Driver',
                style: poppins1.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
              ),
              GestureDetector(
                  onTap: (){
                    // Get.to(const UpdateDocuments());
                  },
                  child: SvgPicture.asset('assets/delSvg.svg'),),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10,right: 10,),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
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
                                  height: 20.h,
                                  width: 20.w,
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
                              child: Center(child: Text('View Details',style: poppins.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.bold,fontSize: 13))),
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

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('OverAll Details',style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700),),
                        ksize5,
                        Text('Your Up to Date Details',style: inter1.copyWith(fontSize: 11.sp,fontWeight: FontWeight.w700),),
                        ksize10,
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.buiskat,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('\$56.00',style: inter1.copyWith(fontSize: 28.sp,fontWeight: FontWeight.bold),),
                                    ksize5,
                                    Text('Your OverAll Amount Earning',style: poppins1.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w700),)
                                  ],
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(bottom: 30.sp),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                    SvgPicture.asset('assets/amount.svg'),
                                  ],),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ksize10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 100.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                color: AppColors.castAwayBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('00',style: inter1.copyWith(fontWeight: FontWeight.w900,fontSize: 19.sp),),
                                      SvgPicture.asset('assets/roralorder.svg')
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Total Order',style: nunito,),
                                      Text('For smaller Goods',style: poppins1.copyWith(fontSize: 10.sp,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                color: AppColors.milkGreen,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('00',style: inter1.copyWith(fontWeight: FontWeight.w900,fontSize: 19.sp),),
                                      SvgPicture.asset('assets/delverorder.svg')
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Delivered Order',style: nunito,),
                                      Text('For smaller Goods',style: poppins1.copyWith(fontSize: 10.sp,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ksize10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 100.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('00',style: inter1.copyWith(fontWeight: FontWeight.w900,fontSize: 19.sp),),
                                      SvgPicture.asset('assets/pending.svg')
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Pending Order',style: nunito,),
                                      Text('For smaller Goods',style: poppins1.copyWith(fontSize: 10.sp,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                color: AppColors.beetroot,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('00',style: inter1.copyWith(fontWeight: FontWeight.w900,fontSize: 19.sp),),
                                      SvgPicture.asset('assets/cancelorder.svg')
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Canceled Order',style: nunito,),
                                      Text('For smaller Goods',style: poppins1.copyWith(fontSize: 10.sp,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      
      ),
    );
  }
}
