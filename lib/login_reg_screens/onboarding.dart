import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veelgo/properties/common properties.dart';

import '../commonClasses.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < 2) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to home page
      Navigator.pushReplacementNamed(context, '/home');
    }
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return  Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 1.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: 95.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: _currentIndex == i
                          ? AppColors.primaryColor
                          : Colors.blue.shade100,
                    ),
                  ),
              ],
            ),
            ksize40,
            SizedBox(
              height: 400.h,
              child: PageView(
                controller: _pageController,
                children: [
                  PageContent(
                    image: 'assets/IMG3.svg',
                    title: 'Effortlessly Monitor Your ',
                    subtitle: 'Booking Orders',
                    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  ),
                  PageContent(
                    image: 'assets/IMG2.svg',
                    subtitle: 'Accepting Rides Instantly',
                    title: 'Get Onboard and Start ',
                    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  ),
                  PageContent(
                    image: 'assets/img1.svg',
                    subtitle: 'Earning   with ease',
                    title: 'Keep Tabs on your ',
                    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  ),
                ],
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),

             Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: SizedBox(
                     height: 45.h,
                     width: size.width,
                     child: ElevatedButton(
                       onPressed: () {
                         _nextPage();
                         // Add your onPressed code here!
                       },
                       style: ElevatedButton.styleFrom(
                         primary: AppColors.primaryColor, // Background color// Text color
                         side: const BorderSide(color: AppColors.primaryColor, width: 1),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(13), // Rounded corners
                         ),
                         // Border color and width
                       ),
                       child:  Text('Next',style: poppins1.copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.sp,letterSpacing: 1),),
                     ),
                   ),
                 ),
               ksize15,
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: SizedBox(
                     height: 43.h,
                     width: size.width,
                     child: ElevatedButton(
                       onPressed: () {
                         Navigator.pushNamed(context, '/home');
                         // Add your onPressed code here!
                       },
                       style: ElevatedButton.styleFrom(
                         primary: Colors.white, // Background color// Text color
                         side: const BorderSide(color: AppColors.primaryColor, width: 1),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(13), // Rounded corners
                         ),
                         // Border color and width
                       ),
                       child:  Text('Skip',style: poppins1.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.bold,fontSize: 15.sp,letterSpacing: 1),),
                     ),
                   ),
                 ),
               ],
             ),
            SizedBox(height: 1.h,),




          ],
        ),

      ),

    );
  }
}
