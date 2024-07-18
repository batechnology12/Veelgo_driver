import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:veelgo/controller/Account_screen_controller.dart';
import 'package:veelgo/controller/booking_controller.dart';
import 'package:veelgo/dashboard/bottomFeatures/home.dart';
import 'package:veelgo/dashboard/map/pickDrop_details.dart';
import 'package:veelgo/login_reg_screens/createPasswrd.dart';
import 'package:veelgo/login_reg_screens/forgotPasswrd.dart';
import 'package:veelgo/personolOtp.dart';
import 'package:veelgo/wallet/BankDetails.dart';
import 'package:veelgo/wallet/FAQ.dart';
import 'package:veelgo/wallet/myEarnings.dart';
import 'package:veelgo/wallet/transactionHistory.dart';

import 'account/manageDriver.dart';
import 'account/myProfile.dart';
import 'account/settings.dart';
import 'account/updateDocuments/addDriverDoc.dart';
import 'apiCalls.dart';
import 'chatScreen/one.dart';
import 'controller/authController.dart';
import 'dashboard/bottomFeatures/account.dart';
import 'dashboard/deliveryProof/confirmDelivery.dart';
import 'dashboard/deliveryProof/customerSign.dart';
import 'dashboard/driverTabs/All.dart';
import 'dashboard/driver_mainscreen.dart';
import 'dashboard/map/reachedLocation1.dart';
import 'dashboard/paymentDetails/collectCash.dart';
import 'login_reg_screens/PersonalDoc.dart';
import 'login_reg_screens/fleetDoc.dart';
import 'login_reg_screens/login.dart';
import 'login_reg_screens/otp.dart';
import 'login_reg_screens/register.dart';
import 'login_reg_screens/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  Get.put(BookingController());
  Get.put(AccounctScrrenaController());
  runApp(const MyApp());
  // runApp(
  //   // DevicePreview(
  //   //   enabled: !kReleaseMode,
  //   //   builder: (context) => const MyApp(), // Wrap your app
  //   // ),
  // );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          // Use GetMaterialApp instead of MaterialApp
          debugShowCheckedModeBanner: false,
          home: SplashScreen(), // No need for const here
          getPages: [
            // Define routes using GetX's GetPage
            GetPage(name: '/home', page: () => const LoginPage()),
            GetPage(name: '/register', page: () => const Register()),
            GetPage(
                name: '/otpVerify',
                page: () => OtpVerification(
                      otp: '',
                      phn: '',
                    )),
            // GetPage(name: '/prson_updateprofl', page: () => const PersonolDocuments()),
            GetPage(name: '/fleetDoc', page: () => const FleetDocuments()),
            GetPage(name: '/forgotPassword', page: () => ForgotPassword()),
            GetPage(
                name: '/createPassword', page: () => const CreatePassword()),
            GetPage(
                name: '/dashboardScreen',
                page: () => const MainDashboardScreen()),
            GetPage(
                name: '/map',
                page: () => PickupDrop(
                      acceptbookingdata: [],
                    )),
            // GetPage(
            //     name: '/confirmDelivery', page: () =>  ConfirmDelivery()),
            GetPage(name: '/customerSign', page: () => const CustomerSign()),
            // GetPage(name: '/payment', page: () => const PaymentDetails()),
            GetPage(
                name: '/dashboardScreen',
                page: () => const MainDashboardScreen()),
            GetPage(
              name: '/chatScreen',
              page: () => const ChatScreen(),
            ),

            // Define other routes here...
          ],
        );
      },
    );
  }
}
