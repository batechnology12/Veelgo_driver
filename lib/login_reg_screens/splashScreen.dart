import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/dashboard/driver_mainscreen.dart';
import 'package:veelgo/properties/common properties.dart';
import 'login.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      if (authtoken != null) {
        Get.to(() => MainDashboardScreen());
      }
      else {
        Get.to(const LoginPage());
      };
    });

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'VEEL',
              style: GoogleFonts.inter(
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'GO',
              style: GoogleFonts.inter(
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}