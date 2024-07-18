import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../properties/common properties.dart';
import 'OrderDetails.dart';


class MyEarningsPage extends StatefulWidget {
  @override
  State<MyEarningsPage> createState() => _MyEarningsPageState();
}

class _MyEarningsPageState extends State<MyEarningsPage> {
  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'My Earnings',
          style: inter1.copyWith(
              fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 17,
              color: Colors.white,
            )),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 190.h,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    color: AppColors.primaryColor,
                    height: 90,
                    width: size.width,
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.black,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey.shade50,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(

                        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(

                          leading: Icon(Icons.access_time,color: Colors.red,),
                          title: Row(
                            children: [
                              Text('Booking ID : ',style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.w700,color: AppColors.bluegrey),),
                              Text('#ZAGO1',style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.w700),),
                            ],
                          ),
                          subtitle: Text('4.30PM TO 6.00PM'), // Example subtitle
                          trailing: Text('\$+25',style: inter1.copyWith(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 15),),
                          onTap: () {
                            Get.to(OrderDetails(index: index));
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 90.h,
            left: 25.sp,
            right: 25.sp,
            child: Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '10 Mar - 15 Mar',
                        style: inter1.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            '\$90',
                            style: inter1.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 17.sp),
                          ),
                          Text(
                            'Earnings',
                            style: inter1.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.red,
                        thickness: 2,
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          Text(
                            '20',
                            style: inter1.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 17.sp),
                          ),
                          Text(
                            'Total Orders',
                            style: inter1.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
