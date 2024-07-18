import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/login_reg_screens/login.dart';
import 'package:veelgo/properties/common%20properties.dart';

import '../../account/FAQ.dart';
import '../../account/chat.dart';
import '../../account/invoice.dart';
import '../../account/logOut.dart';
import '../../account/manageDriver.dart';
import '../../account/myProfile.dart';
import '../../account/referFriends.dart';
import '../../account/reviewRate.dart';
import '../../account/settings.dart';
import '../../network/controllers/auth_api_controllers.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  AuthControllers myAccountController = Get.put(AuthControllers());


  late List<Map<String, dynamic>> items;
  @override
  void initState() {
    super.initState();
    items = [
      {
        'icon': 'assets/man.png',
        'text': 'My Profile',
        'route': AccountMyProfile()
      },
      {
        'icon': 'assets/driver_out.png',
        'text': 'Manage Driver',
        'route': ManageDriver()
      },
      {
        'icon': 'assets/setting_out.png',
        'text': 'Settings',
        'route': AccountSettings()
      },
      {
        'icon': 'assets/faq_out.png',
        'text': 'FAQ',
        'route': AccountFAQ()
      },
      {
        'icon': 'assets/chat_out.png',
        'text': 'Chat',
        'route': const ChatScreen()
      },
      {
        'icon': 'assets/invoice_out.png',
        'text': 'Invoice',
        'route': AccountInvoice()
      },
      {
        'icon': 'assets/reff_out.png',
        'text': 'Refer Friends',
        'route':  ReferFriends()
      },
      {
        'icon': 'assets/review_out.png',
        'text': 'Review Rate',
        'route': _showReviewRateDialog,
      },
      {
        'icon': 'assets/logout_out.png',
        'text': 'Logout',
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
                'LogOut',
                style: inter1.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Are you sure you want to LogOut?',
                style: inter1.copyWith(fontSize: 14.sp, color: AppColors.bluegrey, fontWeight: FontWeight.w900),
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
                      child: Text('Cancel', style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: AppColors.primaryColor)),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 120.w,
                    child: ElevatedButton(
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.clear();
                        Get.offAll(() => const LoginPage());

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor), // Replace with your desired color
                      ),
                      child: Text('LogOut', style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white)),
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

  void _showReviewRateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: 250.h, // Adjusted height to accommodate rating stars
            width: 300.w, // Adjusted width as needed
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rate us experiences',
                    style: inter1.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'Please let us know how do you feel\nabout this app',
                      style: inter1.copyWith(
                        fontSize: 13.sp,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 1, color: AppColors.primaryColor),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12),
                            child: Text(
                              'Cancel',
                              style: inter1.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12),
                            child: Text(
                              'Submit',
                              style: inter1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        toolbarHeight: 140.h,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My Account',
              style: inter1.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
            ksize20,
            Row(
              children: [
                CircleAvatar(
                  radius: 30.sp, // Reduced size
                  child: Image.asset(
                    'assets/profilepic2.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(myAccountController.getUserData!.firstName,
                      style: poppins1.copyWith(fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    ksize5,
                    Text(
                      'Vehicle Driver',
                      style: inter1.copyWith(fontSize: 14.sp, color: Colors.white, letterSpacing: 1),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 40.h,
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios,size: 12.sp,),
                  leading: Image.asset(
                    items[index]['icon'],
                    width: 20.w, // Set the desired width
                    height: 20.h, // Set the desired height
                  ),
                  title: Text(items[index]['text'],style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.bold),),
                  onTap: () {
                    if (items[index]['text'] == 'Review Rate') {
                      _showReviewRateDialog(context);
                    } else if (items[index]['route'] != null) {
                      if (items[index]['route'] is VoidCallback) {
                        items[index]['route']();
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => items[index]['route'],
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
              Divider(
                indent: 20,
              ), // Add divider between items
            ],
          );
        },
      ),
    );
  }
}
