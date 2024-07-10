


import 'dart:io';
import 'package:camera_gallery_image_picker/camera_gallery_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veelgo/dashboard/map/reachedLocation2.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../properties/common properties.dart';

class LocationOne extends StatefulWidget {
  const LocationOne({super.key});

  @override
  State<LocationOne> createState() => _LocationOneState();
}

class _LocationOneState extends State<LocationOne> {

  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  // File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min, // Add this line
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Padding(
              padding:
              const EdgeInsets.only(left: 150,right: 150,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                height: 3.h,
              ),
            ),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Booking ID: #ZAG01',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Paid',
                    style: inter1.copyWith(fontSize: 19.sp,fontWeight:FontWeight.bold,color: AppColors.dolorGreen),
                  ),
                ),
              ],
            ),
            ksize10,
            ksize10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on,color:Colors.teal),
                        wsize5,
                        wsize5,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Pickup Details',
                                  style: poppinsBg,
                                ),
                                ksize5,
                                ksize2,
                                Container(
                                  width: 180.w,
                                  child: Text(
                                    '338C Anchorvale Cresent, 543338\nJagathishwar\Unit #12-39',
                                    style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w700),
                                  ),
                                ),
                                ksize10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Row(
                                      children: [
                                         Icon(Icons.phone,size: 12.sp,),

                                        Text('Call',style:poppins1.copyWith(fontSize: 11.sp,fontWeight: FontWeight.w700,color: Colors.black),)
                                      ],
                                    ),
                                    wsize5,
                                    wsize2,
                                    Row(
                                      children: [
                                        SizedBox(
                                            height:12.sp,
                                            child: SvgPicture.asset('assets/wtsap.svg',)),

                                        Text('WatsApp',style:poppins1.copyWith(fontSize: 11.sp,fontWeight: FontWeight.w700,color: Colors.black),)
                                      ],
                                    ),
                                    wsize5,
                                    wsize2,
                                    Row(
                                      children: [
                                         Icon(Icons.message,size: 12.sp,),
                                        wsize2,
                                        Text('Message',style:poppins1.copyWith(fontSize: 11.sp,fontWeight: FontWeight.w700,color: Colors.black),)
                                      ],
                                    ),

                                  ],
                                )
                              ],
                            ),


                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '3pm to 4pm',
                          style: MyFonts.interBG,
                        ),
                        ksize10,
                        SizedBox(
                            height: 12.h,
                            child: SvgPicture.asset('assets/arrow.svg')),

                      ],
                    )
                  ],
                ),
            ksize10,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Divider(
                thickness: 1,
              ),
            ),
            ksize10,
            Text(
              'Remarks',
              style: poppinsBg,
            ),
            ksize5,
             Text(
              'Call me before reacing and wait at lobby 6B',
               style: inter1.copyWith(fontWeight:FontWeight.w600,fontSize: 15,),
            ),
            ksize10,
            ksize10,
            Center(
              child: Container(
                height: 80.h,
                width: 260.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(
                      10), // Half of the width or height to make it circular
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap:(){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Dialog(
                                  child: Container(
                                    height: 300.h,
                                    width: 300.w,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ksize20,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Booking Id', style: MyFonts.interSheetmini),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: SvgPicture.asset('assets/x.svg'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },
                                              ),
                                              Text('#ZAGO2', style: MyFonts.interMed1),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked1,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isChecked1 = value!;
                                                  });
                                                },
                                              ),
                                              Text('#ZAGO3', style: MyFonts.interMed1),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked2,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isChecked2 = value!;
                                                  });
                                                },
                                              ),
                                              Text('#ZAGO4', style: MyFonts.interMed1),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked3,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isChecked3 = value!;
                                                  });
                                                },
                                              ),
                                              Text('#ZAGO1', style: MyFonts.interMed1),
                                            ],
                                          ),
                                          ksize10,
                                          Center(
                                            child: SizedBox(
                                              height: 35.h,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (!isChecked && !isChecked1 && !isChecked2 && !isChecked3) {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(
                                                        content: Text('Please select at least one checkbox.'),
                                                      ),
                                                    );
                                                  } else {

                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: AppColors.primaryColor, // Change button color
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Submit',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );

                          },
                        );
                      },
                      child: GestureDetector(

                        onTap: (){
                          popid(context);
                        },
                        child: const Text(
                          '+2 View Id',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h),
                      child: const VerticalDivider(
                        thickness: 1,
                        color: Colors.black54,
                      ),
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap:() async {
                            // imageFile = await CameraGalleryImagePicker.pickImage(
                            //   context: context,
                            //   source: ImagePickerSource.camera,
                            // );
                            // setState(() {});
                          },
                          child: Icon(
                            Icons.camera_alt,
                            size: 20.sp,
                          ),
                        ),
                        Text(
                          'Picture',
                          style: MyFonts.interMed0,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            ksize15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount',
                  style: inter1.copyWith(fontSize: 19,fontWeight:FontWeight.bold,color: AppColors.bluegrey),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: SvgPicture.asset('assets/dolor.svg'),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '\$65.5',
                      style: inter1.copyWith(fontSize: 20,fontWeight: FontWeight.w900,color: AppColors.dolorGreen),
                    ),
                    wsize10,
                    SizedBox(
                        height: 14.h,
                        child: SvgPicture.asset('assets/i.svg')),
                  ],
                ),
              ],
            ),
            ksize15,
            Center(
              child: SizedBox(
                height: 46.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const LocationTwo();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor, // Change button color

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Confirm Picked',
                    style: inter1.copyWith(fontWeight: FontWeight.w700,fontSize: 14.sp,color: Colors.white,letterSpacing: 1),
                  ),
                ),
              ),
            ),
            ksize10,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:(){

                    },
                    child: GestureDetector(
                      onTap: (){
                        pophelp(context);
                      },
                      child: const Text(
                        'Help',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ksize10,
          ],
        ),
      ],
    );
  }
  popid(BuildContext context) {
    bool isEditDetailsChecked = false;
    bool checking1 = false;
    bool checking2 = false;
    bool checking3 = false;


    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9, // Set the desired width here
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking Id',
                          style: inter1.copyWith(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            size: 27.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    ksize10,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEditDetailsChecked = !isEditDetailsChecked;
                                });
                              },
                              child: Container(
                                height: 23.h,
                                width: 23.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.bluegrey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: isEditDetailsChecked
                                    ? SvgPicture.asset("assets/boxtik.svg")
                                    : Text(""),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("#ZAG01",
                                style: inter1.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        ksize10,
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  checking1 = !checking1;
                                });
                              },
                              child: Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.bluegrey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: checking1
                                    ? SvgPicture.asset("assets/boxtik.svg")
                                    : Text(""),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("#WKA02",
                                style: inter1.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        ksize10,
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  checking2 = !checking2;
                                });
                              },
                              child: Container(
                                height: 23.h,
                                width: 23.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.bluegrey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: checking2
                                    ? SvgPicture.asset("assets/boxtik.svg")
                                    : Text(""),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("#WKA03",
                                style: inter1.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        ksize10,
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  checking3 = !checking3;
                                });
                              },
                              child: Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.bluegrey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: checking3
                                    ? SvgPicture.asset("assets/boxtik.svg")
                                    : Text(""),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("#WKA05",
                                style: inter1.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        if (!isEditDetailsChecked &&
                            !checking1 &&
                            !checking2 &&
                            !checking3) {
                          SnackbarUtils.showSnackbar(context, 'Please select atleast one id');
                        } else {
                           Get.back();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Confirm',
                          style: inter1.copyWith(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );

      },
    );
  }
  pophelp(BuildContext context) {
    bool damage = false;
    bool alternative = false;
    bool notListed = false;
    bool others = false;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.9, // Set the desired width here
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Help',
                            style: inter1.copyWith(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon:  Icon(
                                Icons.cancel_outlined,
                                size: 27.sp,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      ksize10,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    damage = !damage;
                                  });
                                },
                                child: Container(
                                  height: 23.h,
                                  width: 23.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: AppColors.bluegrey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: damage
                                      ? SvgPicture.asset("assets/boxtik.svg")
                                      : const Text(""),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text("Damage",
                                  style: inter1.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ))
                            ],
                          ),
                          ksize10,
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    alternative =
                                    !alternative;
                                  });
                                },
                                child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: AppColors.bluegrey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: alternative
                                      ? SvgPicture.asset("assets/boxtik.svg")
                                      : Text(""),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text("Found a better alternative",
                                  style: inter1.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ))
                            ],
                          ),
                          ksize10,
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    notListed = !notListed;
                                  });
                                },
                                child: Container(
                                  height: 23.h,
                                  width: 23.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: AppColors.bluegrey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: notListed
                                      ? SvgPicture.asset("assets/boxtik.svg")
                                      : const Text(""),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text("Damage",
                                  style: inter1.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ))
                            ],
                          ),
                          ksize10,
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    others =
                                    !others;
                                  });
                                },
                                child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: AppColors.bluegrey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: others
                                      ? SvgPicture.asset("assets/boxtik.svg")
                                      : Text(""),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text("Found a better alternative",
                                  style: inter1.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ))
                            ],
                          ),
                          ksize10,
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Confirm',
                            style: inter1.copyWith(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

}
