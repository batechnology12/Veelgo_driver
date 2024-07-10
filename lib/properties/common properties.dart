import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0043B4);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color textColor = Color(0xFF333333);
  static const Color white = Color(0xFFF5F5F5);
  static const Color bluegrey = Color(0xFF455A64);
  static const Color seaBlue = Color(0xFFDFEFFF);
  static const Color lytBlue = Color(0xFFF4F8FF);
  static const Color interPop = Color(0xFF7C86A2);
  static const Color dolorGreen = Color(0xFF009045);
  static const Color locoRed = Color(0xFFF74354);
  static const Color teal = Color(0xFF038484);
  static const Color lytGreen = Color(0xFFD9FFDA);
  static const Color lytRed = Color(0xFFFFF0F0);
  static const Color red = Color(0xFFFF4141);
  static const Color lytYellow = Color(0xFFFFF9D9);
  static const Color buiskat = Color(0xFFFEB756);
  static const Color milkGreen = Color(0xFF96FF56);
  static const Color castAwayBlue = Color(0xFF56CCFF);
  static const Color yellow = Color(0xFFFFF856);
  static const Color beetroot = Color(0xFFFF5660);


}
var poppins = GoogleFonts.poppins(fontSize :13.sp.sp,color: AppColors.white,fontWeight: FontWeight.w500);
var poppinsB = GoogleFonts.poppins(fontSize: 13.sp,color: Colors.black,fontWeight: FontWeight.w500);
var interMiniBg = GoogleFonts.inter(fontSize: 14.sp,color: AppColors.bluegrey,fontWeight: FontWeight.w700);
var inter1 = GoogleFonts.inter();
var poppins2 = GoogleFonts.poppins(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w700);
var times = GoogleFonts.ebGaramond();
var poppins1 = GoogleFonts.poppins();
var addInter = GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 13.sp,color: Colors.black);
var intermid = GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 12.sp);
var poppinsBg = GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.sp,color: AppColors.bluegrey);
var interMedi = GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14.sp,color: AppColors.bluegrey);


class SnackbarUtils {
  static void showSnackbar(BuildContext context, String message,
      {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
        backgroundColor: Colors.orange,
        content: Text(message,style: inter1.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
        duration: duration,
        // You can customize further properties such as background color, action, etc.
      ),
    );
  }
}

class CircularLoadingIndicator extends StatelessWidget {
  final String message;

  const CircularLoadingIndicator({Key? key, this.message = "Loading..."}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Colors.grey,),
            SizedBox(width: 16.0),
            Text(message),
          ],
        ),
      ),
    );
  }
}

var wsize10 = SizedBox(
    width: 10.w);
var wsize5= SizedBox(
    width: 5.h);
var wsize3= SizedBox(
    width: 3.h);
var wsize2= SizedBox(
    width: 2.h);



var ksize2 = SizedBox(
    height: 2.h);
var ksize10 = SizedBox(
    height: 10.h);
var ksize8 = SizedBox(
    height: 8.h);
var ksize5 = SizedBox(
    height: 5.h);
var ksize4 = SizedBox(
    height: 4.h);
var ksize15 = SizedBox(
    height: 15.h);
var ksize20 = SizedBox(
    height: 20.h);
var ksize30 = SizedBox(
    height: 30.h);
var ksize40 = SizedBox(
    height: 40.h);
var ksize50 = SizedBox(
    height: 50.h);


class MyFonts {
  static  TextStyle interBlack = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
    color: Colors.black,
    // You can replace 'Montserrat' with any other Google Font
  );
  static  TextStyle interSheet = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: Colors.black,
    // You can replace 'Montserrat' with any other Google Font
  );
  static  TextStyle interSheetmini = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
    color: Colors.black,
    // You can replace 'Montserrat' with any other Google Font
  );


  static  TextStyle interMed1 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
    color: Colors.black,
    // You can replace 'Montserrat' with any other Google Font
  );
  static  TextStyle intercrt = TextStyle(
    fontSize: 13.sp,
    fontFamily: 'Inter',
    color: Colors.black,
    fontWeight: FontWeight.w500
    // You can replace 'Montserrat' with any other Google Font
  );
  static  TextStyle dolorpay = TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Inter',
      color: AppColors.dolorGreen,
      fontWeight: FontWeight.w800
    // You can replace 'Montserrat' with any other Google Font
  );

  static const TextStyle interMed = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    color: AppColors.bluegrey,

    // You can replace 'Montserrat' with any other Google Font
  );


  static  TextStyle interMed0 = TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      color: Colors.black,
      fontWeight: FontWeight.w600
    // You can replace 'Montserrat' with any other Google Font
  );
  static const TextStyle interbig = TextStyle(
      fontSize: 15,
      fontFamily: 'Inter',
      color: Colors.black,
      fontWeight: FontWeight.w600
    // You can replace 'Montserrat' with any other Google Font
  );




  static  TextStyle interBG = TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Inter',
      color: AppColors.bluegrey,
      fontWeight: FontWeight.w600
    // You can replace 'Montserrat' with any other Google Font
  );
  static  TextStyle interBGBig = TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      color: AppColors.bluegrey,
      fontWeight: FontWeight.w700
    // You can replace 'Montserrat' with any other Google Font
  );
  static  TextStyle timebg = TextStyle(
      fontSize: 11.sp,
      fontFamily: 'Inter',
      color: AppColors.bluegrey,
      fontWeight: FontWeight.w600
    // You can replace 'Montserrat' with any other Google Font
  );


  static  TextStyle interMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: AppColors.bluegrey,
    // You can replace 'Montserrat' with any other Google Font
  );

  static const TextStyle interCom = TextStyle(
    fontSize: 20,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    // You can replace 'Montserrat' with any other Google Font
  );



  static const TextStyle interPop = TextStyle(
    fontSize: 15,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColors.interPop,
    // You can replace 'Montserrat' with any other Google Font
  );
  static const TextStyle popinWhite = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: Colors.white,
    // You can replace 'Montserrat' with any other Google Font
  );

  static const TextStyle nunito = TextStyle(
    fontSize: 18,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor

    // You can replace 'Montserrat' with any other Google Font
  );



  static  TextStyle interBlue = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
    color: AppColors.primaryColor,
    // You can replace 'Montserrat' with any other Google Font
  );



  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: Colors.blue, // Example of customizing the color
  );

  static const TextStyle descriptionStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'Roboto', // You can replace 'Roboto' with any other Google Font
  );


// Define more font styles as needed
}