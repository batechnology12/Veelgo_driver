import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veelgo/account/settings/delete_account.dart';
import 'package:veelgo/account/settings/notification_settings.dart';
import 'package:veelgo/account/settings/password_manager.dart';

import '../properties/common properties.dart';


class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  late List<Map<String, dynamic>> items;

  @override
  void initState() {
    super.initState();
    items = [
      {
        'icon': 'assets/bell_outlined.png',
        'text': 'Notification Settings',
        'route': NotificationSettings(),
      },
      {
        'icon': 'assets/key_outlined.png',
        'text': 'Password Manager',
        'route': PasswordManager(),
      },
      {
        'icon': 'assets/delete_outlined.png',
        'text': 'Delete Account',
        'route': _showDeleteAccountBottomSheet,
      },
    ];
  }

  void _showDeleteAccountBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Delete Account',
                style: inter1.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Are you sure you want to delete your account?',
                style: inter1.copyWith(fontSize: 14.sp,color: AppColors.bluegrey,fontWeight: FontWeight.w900),
              ),
              ksize20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 120.w,

                    child: ElevatedButton(
                      onPressed: () {
                        // Add delete account logic here
                        Navigator.pop(context);

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.white), // Replace with your desired color
                      ),
                      child: Text('Cancel',style: inter1.copyWith(fontWeight: FontWeight.w800,fontSize: 15,color: AppColors.primaryColor),),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 120.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor), // Replace with your desired color
                      ),
                      child: Text('Yes, Delete',style: inter1.copyWith(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.white),),
                    ),
                  ),
                ],
              ),
              ksize20,

            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new_outlined, size: 16.sp),
        ),
        title: Text(
          'Settings',
          style: poppins1.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  if (items[index]['route'] is VoidCallback) {
                    items[index]['route'](); // Call the function directly
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => items[index]['route'],
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      Image.asset(
                        items[index]['icon'],
                        width: 20.w,
                        height: 20.h,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20.w),
                      Text(
                        items[index]['text'],
                        style: inter1.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14.sp,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade400,
                indent: 20.w,
              ),
            ],
          );
        },
      ),
    );
  }
}
