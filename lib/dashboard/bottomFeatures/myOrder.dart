import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:veelgo/myOrders/cancelled.dart';
import 'package:veelgo/myOrders/completed.dart';
import 'package:veelgo/myOrders/ongoing.dart';

import '../../controller/authController.dart';
import '../../properties/common properties.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final authController = Get.put(AuthController());
   TabController? _tabController;

  final PageController _pageController  = PageController();
  int _selectedIndex = 0;
  bool status = false;

  final List<String> _headers = ['Ongoing', 'Completed', 'Cancelled'];

  final List<Widget> _screenWidgets = [
    const Ongoing(),
    const Completed(),
    const Cancelled(),
  ];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lytBlue,

      body: Column(
        children: [
          Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.19,
                        decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17))),
                        child: Center(child: Text('Assigning Task',style: inter1.copyWith(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 17.sp),),),
                      ),
                      Container(
                                          decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0.00, 0.80),
                            color: AppColors.primaryColor)
                      ],
                      color: Colors.grey.shade100,
                                          ),
                                        )
                ],
              ),
              Positioned(
                top: size.height * .13,
                left: 13,
                right: 13,
                child: Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)),
                  child: Center(
                    child:
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _headers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25), // Adjust the value according to your preference
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.transparent, // Change this color to make the red border disappear
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: 16.w,),
                                        child: Container(
                                          height: 35.h,
                                       padding: EdgeInsets.only(left: 10.w,right: 10.w,),
                                          decoration: BoxDecoration(
                                            color: index == _selectedIndex ? AppColors.primaryColor : Colors.white,
                                            borderRadius: BorderRadius.circular(20), // Adjust the value according to your preference
                                          ),
                                          child: Center(
                                            child: Text(
                                              _headers[index],
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: index == _selectedIndex ? Colors.white : Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        // InkWell(
                        //   onTap: () {
                        //
                        //     authController.containerIndex(0);
                        //     authController.update();
                        //   },
                        //   child: Container(
                        //     height: 35.h,
                        //     width: 97.w,
                        //     decoration: BoxDecoration(
                        //         color:
                        //         authController.containerIndex.value == 0
                        //             ? AppColors.primaryColor
                        //             : Colors.grey.shade100,
                        //         borderRadius: BorderRadius.circular(30)),
                        //     child: Center(
                        //         child: Text(
                        //           'Ongoing',
                        //           style: inter1.copyWith(
                        //               color:
                        //               authController.containerIndex.value ==
                        //                   0
                        //                   ? AppColors.white
                        //                   : Colors.black,
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 13.sp),
                        //         )),
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     authController.containerIndex(1);
                        //     authController.update();
                        //   },
                        //   child: Container(
                        //     height: 35.h,
                        //     width: 97.w,
                        //     decoration: BoxDecoration(
                        //         color:
                        //         authController.containerIndex.value == 1
                        //             ? AppColors.primaryColor
                        //             : Colors.grey.shade100,
                        //         borderRadius: BorderRadius.circular(30)),
                        //     child: Center(
                        //         child: Text(
                        //           'Completed',
                        //           style: inter1.copyWith(
                        //               color:
                        //               authController.containerIndex.value ==
                        //                   1
                        //                   ? AppColors.white
                        //                   : Colors.black,
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 14.sp),
                        //         )),
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     authController.containerIndex(2);
                        //     authController.update();
                        //   },
                        //   child: Container(
                        //     height: 35.h,
                        //     width: 97.w,
                        //     decoration: BoxDecoration(
                        //         color:
                        //         authController.containerIndex.value == 2
                        //             ? AppColors.primaryColor
                        //             : Colors.grey.shade100,
                        //         borderRadius: BorderRadius.circular(30)),
                        //     child: Center(
                        //         child: Text(
                        //           'Cancelled',
                        //           style: inter1.copyWith(
                        //               color:
                        //               authController.containerIndex.value ==
                        //                   2
                        //                   ? AppColors.white
                        //                   : Colors.black,
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 14.sp),
                        //         )),
                        //   ),
                        // ),


                    ),
                  ),
                ),

            ],
          ),
          ksize10,
          Flexible(
            child: Container(
              height: 600.h,
              color: AppColors.white,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700), // Adjust the duration as needed
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: _screenWidgets[_selectedIndex],
              ),
            ),
          )
        ],
      ));

  }
}