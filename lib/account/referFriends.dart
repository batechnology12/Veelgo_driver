import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:veelgo/properties/common%20properties.dart';

class ReferFriends extends StatefulWidget {
  const ReferFriends({super.key});

  @override
  State<ReferFriends> createState() => _ReferFriendsState();
}

class _ReferFriendsState extends State<ReferFriends> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Refer Friends',
            style: poppins1.copyWith(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18.sp),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
              size: 16.h,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ksize20,
              Text(
                'Share your code with your friends\nand earn cash and points.',
                textAlign: TextAlign.center,
                style: inter1.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              ksize10,
              SvgPicture.asset("assets/refffrds.svg"),
              ksize10,
              Text(
                'Just share this code with your friends\nand ask then to signup and add this code. Both of you will get earn CASH and POINTS',
                textAlign: TextAlign.center,
                style: inter1.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              ksize20,
              Container(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                height: 50.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: AppColors.seaBlue,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'QRT67',
                        textAlign: TextAlign.center,
                        style: inter1.copyWith(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Share Code",
                        style: inter1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}