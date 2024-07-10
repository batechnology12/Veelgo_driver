import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veelgo/commonClasses.dart';
import 'package:veelgo/properties/common%20properties.dart';

import 'fleetPartner.dart';
import 'personalAccount.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ksize30,
                Text(
                  'Register',
                  style: inter1.copyWith(fontWeight: FontWeight.bold,fontSize: 24,),
                ),
                ksize10,
                 Text(
                  'Please Create your Phone Number &\nPassword to sign in',style: inter1.copyWith(fontWeight: FontWeight.w800),
                ),
               ksize15,
                Center(
                  child: Container(
                    height:50.h,
                    decoration: BoxDecoration(
                      color: AppColors.seaBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TabItem(
                          text: 'Personal Account',
                          isSelected: _currentIndex == 0,
                          onTap: () {
                            setState(() {
                              _currentIndex = 0;
                            });
                          },
                        ),
                        TabItem(
                          text: 'Fleet Partner',
                          isSelected: _currentIndex == 1,
                          onTap: () {
                            setState(() {
                              _currentIndex = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: sHeight / 50),
                Container(
                  child: _currentIndex == 0
                      ? const PersonalAccountContent()
                      : const FleetPartnerContent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabItem extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  TabItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 40.h,
           width: 140.w,
          padding: const EdgeInsets.symmetric(horizontal: 12), // Adjust horizontal padding
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.isSelected ? AppColors.primaryColor : Colors.transparent, // Use transparent if not selected
          ),
          child: Center(
            child: Text(
              widget.text,
              textAlign: TextAlign.center, // Center text horizontally
              style: TextStyle(
                color: widget.isSelected ? Colors.white : Colors.black, // Default text color
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
              maxLines: 1, // Ensure text stays on a single line
              overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows container
            ),
          ),
        ));
  }
}
