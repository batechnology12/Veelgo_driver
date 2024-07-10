import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veelgo/properties/common%20properties.dart';

import '../../wallet/BankDetails.dart';
import '../../wallet/FAQ.dart';
import '../../wallet/myEarnings.dart';
import '../../wallet/transactionHistory.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.person_outline_outlined, 'text': 'My Earnings','route': MyEarningsPage() },
      {'icon': Icons.settings_outlined, 'text': 'Transaction History','route': TransactionHistoryPage()},
      {'icon': Icons.question_mark, 'text': 'Bank Details','route': BankDetailsPage()},
      {'icon': Icons.exit_to_app, 'text': 'FAQ','route': FAQPage()},
    ];

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 140.h,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15.0), // Adjust the radius as needed
                    bottomLeft: Radius.circular(15.0),  // Adjust the radius as needed
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey.shade50,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.h),
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => items[index]['route'],
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                                child: Row(
                                  children: [
                                    Text(items[index]['text'], style: inter1.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14.sp,
                                      color: Colors.blueGrey, // Customize icon color as needed
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.shade400, // Customize divider color
                              indent: 20.w, // Adjust the left indent of the divider
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height * .09,
            left: 40.sp,
            right: 40.sp,
            child: Container(
              height: 140.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('\$356.00', style: inter1.copyWith(fontWeight: FontWeight.bold, fontSize: 25.sp),),
                      Text('Available balance', style: inter1.copyWith(fontWeight: FontWeight.w700, fontSize: 14.sp),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40.h,
                        width: 110.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.drive_folder_upload, color: Colors.white,),
                            Text('Top Up', style: inter1.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.white),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 120.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.download_for_offline, color: AppColors.primaryColor,),
                            Text('Withdrawal', style: inter1.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w700, color: AppColors.primaryColor),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primaryColor, // Border color
                            width: 1.9, // Border width
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
