import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veelgo/account/updateDocuments/updateVehicle.dart';

import '../../properties/common properties.dart';
import 'UpdateNRIC.dart';
import 'addDriver.dart';

class UpdateDocuments extends StatefulWidget {
  const UpdateDocuments({super.key});

  @override
  State<UpdateDocuments> createState() => _UpdateDocumentsState();
}

class _UpdateDocumentsState extends State<UpdateDocuments> {

  final List<Map<String, dynamic>> items = [
    {'icon': 'assets/driver.png', 'text': 'Add Driver','route':const AddDriver()},
    {'icon': 'assets/car.png', 'text': 'Update Vehicle Details','route':const RealUpdateVehicleDetails()},
    {'icon': 'assets/nric.png', 'text': 'Update NRIC','route':const RealUpdateNIRC ()},

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Update Documents',
          style: poppins1.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new_outlined, size: 15.sp),
        ),
      ),
      body: ListView.builder(
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
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      Image.asset(
                        items[index]['icon'],
                        width: 20.w, // Adjust width as needed
                        height: 20.h, // Adjust height as needed
                        color: Colors.black, // Customize image color as needed
                      ),
                      SizedBox(width: 20.w),
                      Text(
                        items[index]['text'],
                        style: inter1.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
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


    );
  }
}
