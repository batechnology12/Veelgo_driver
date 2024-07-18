import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:veelgo/dashboard/driver_mainscreen.dart';

import '../../properties/common properties.dart';
import '../../properties/common properties.dart';

class PaymentDetails extends StatefulWidget {
  String pickaddress;
  String dropaddress;
  PaymentDetails(
      {super.key, required this.dropaddress, required this.pickaddress});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 19,
            )),
        title: Text(
          'Payment Details',
          style: inter1.copyWith(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 44.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius:
                        BorderRadius.circular(8), // Adjust the value as needed
                  ),
                  child: Center(
                    child: AutoSizeText('Booking Id : #ZAGO1',
                        maxLines: 1,
                        style: inter1.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.black)),
                  ),
                ),
              ),
              ksize20,
              Container(
                height: 153.h,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 4,
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
                                          length: 57.h,
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
                                            ksize2,
                                            Text(
                                              'Pickup Details',
                                              style: poppinsBg,
                                            ),
                                            ksize4,
                                            Container(
                                              width: 240.w,
                                              child: Text(
                                                '338C Anchorvale Cresent, 543338',
                                                style: addInter,
                                              ),
                                            ),
                                            ksize4,
                                            Text(
                                              'PickUp at 4.00PM',
                                              style: poppins1.copyWith(
                                                  fontSize: 12,
                                                  color: AppColors.bluegrey,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
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
                                              width: 240.w,
                                              child: Text(
                                                '338C Anchorvale Cresent, 543338',
                                                style: addInter,
                                              ),
                                            ),
                                            ksize4,
                                            Text(
                                              'Delivered at 4.00PM',
                                              style: poppins1.copyWith(
                                                  fontSize: 12,
                                                  color: AppColors.bluegrey,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade500,
                ),
              ),
              ksize10,
              Text(
                'Payment Details',
                style:
                    inter1.copyWith(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              ksize10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery Fees',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          'Additional Surcharge',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          'Man Power Service',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          'Post Invoice',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          'Fragil Item',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          'GST',
                          style: interMiniBg,
                        ),
                        ksize10,
                        ksize5,
                        Text(
                          'Total Amount',
                          style: inter1.copyWith(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '+\$22.00',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          '+\$0.00',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          '+\$30.00',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          '+\$1.00',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          '+\$3.00',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          '+\$18.00',
                          style: interMiniBg,
                        ),
                        ksize10,
                        Text(
                          '+\$65.00',
                          style: inter1.copyWith(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ksize5,
              ksize10,
              Center(
                child: Container(
                    height: 60.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          _isCompleted ? AppColors.lytGreen : AppColors.lytBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            _isCompleted
                                ? 'Amount add to wallet'
                                : 'You will collect cash from\nCustomer',
                            style: inter1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              _isCompleted ? '+\$65.00' : '+\$52.00',
                              style: inter1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: AppColors.primaryColor),
                            )),
                      ],
                    )),
              ),
              ksize20,
              Center(
                child: SizedBox(
                  height: 46.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onSubmit,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return AppColors
                              .primaryColor; // Use primary color when disabled
                        }
                        return _isCompleted
                            ? AppColors.primaryColor
                            : AppColors.primaryColor;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Text(
                      _isCompleted ? 'Completed' : 'Submit',
                      style: inter1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.white, // Text color remains white
                      ),
                    ),
                  ),
                ),
              ),
              ksize50,
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    setState(() {
      if (!_isCompleted) {
        _isCompleted = true;
      } else {
        // Show bottom sheet
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60.h,
                      width: 60.w,
                      child: SvgPicture.asset('assets/cashcmplet.svg'),
                    ),
                    Text(
                      'Your Delivery Completed\nSuccessfully',
                      style: poppins1.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 45.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MainDashboardScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                AppColors.primaryColor, // Change button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text('Go to home',
                              style: inter1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
