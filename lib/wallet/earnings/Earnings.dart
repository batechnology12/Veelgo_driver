import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veelgo/network/controllers/auth_api_controllers.dart';
import 'package:intl/intl.dart';
import '../../properties/common properties.dart';


class Earnings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthControllers authControllers = Get.put(AuthControllers());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Obx(() {
          if (authControllers.historeload.value) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.grey,),
            );
          } else if (authControllers.walletHistory.isEmpty) {
            return Center(
              child: Text('No data here',style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w700),),
            );
          } else {

            return ListView.builder(
            itemCount: authControllers.walletHistory.length,
            itemBuilder: (context, index) {
              final transaction = authControllers.walletHistory[index];
              String formattedCreatedAt = DateFormat.jm().format(transaction.createdAt);
              String formattedUpdatedAt = DateFormat.jm().format(transaction.updatedAt);
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.red),
                  title: Row(
                    children: [
                      Text('Booking ID : ', style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.bluegrey)),
                      Text('#${transaction.bookingShowId}', style: inter1.copyWith(fontSize: 15, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  subtitle: Text('$formattedCreatedAt to $formattedUpdatedAt', style:inter1.copyWith(fontWeight: FontWeight.w800,color: AppColors.bluegrey,fontSize: 12.sp)),
                  trailing: Text('\$${transaction.amount}', style: inter1.copyWith(color: AppColors.dolorGreen, fontWeight: FontWeight.w700, fontSize: 17.sp)),
                  onTap: () {
                    // Handle onTap event
                  },
                ),
              );
            },
          );}
        }),
      ),
    );
  }
}
