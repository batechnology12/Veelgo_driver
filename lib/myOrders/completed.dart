import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../modelClasses/ongoing_orders.dart';
import '../network/controllers/auth_api_controllers.dart';
import '../properties/common properties.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  final AuthControllers authController = Get.put(AuthControllers());

  @override
  void initState() {
    super.initState();
    // Optionally, you can trigger the fetch here if not done in the controller
    authController.fetchOngoingOrders("completed");
  }

  @override
  Widget build(BuildContext context) {
    return
      Obx(() {
      if (authController.ongoingload.value) {
        return const Center(child: CircularProgressIndicator(color: Colors.grey,));
      } else if (authController.orderslist.isEmpty) {
        return const Center(child: Text('No completed orders'));
      }

      return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: authController.orderslist.length, // Number of items
      itemBuilder: (context, index) {
        Order order = authController.orderslist[index];
        String pickupstarttime = DateFormat.jm().format(order.createdAt);
        String pickupentime = DateFormat.jm().format(order.updatedAt);
        String dropstarttime = DateFormat.jm().format(order.bookingDeliveryAddresses.first.createdAt);
        String dropendtime = DateFormat.jm().format(order.bookingDeliveryAddresses.first.updatedAt);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius:
              BorderRadius.circular(10),
            ),
            margin:
            const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Booking ID: ${order.bookingId}',style:inter1.copyWith(fontWeight: FontWeight.w800,fontSize: 15),),
                      Text('Ongoing',style: inter1.copyWith(fontWeight: FontWeight.w700,color: Colors.orange),),
                    ],),
                ),
                const Divider(thickness: 1,endIndent: 1),
                ksize5,
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              bottom: 30),
                          child: Container(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 20.sp,
                                  color: const Color(
                                      0xff038484),
                                ),
                                Dash(
                                  direction:
                                  Axis.vertical,
                                  length: 50.h,
                                  dashLength: 5,
                                  dashColor: AppColors
                                      .primaryColor,
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 20.sp,
                                  color:
                                  const Color(0xffF74354),
                                ),
                              ],
                            ),
                          ),
                        ),
                        wsize5,
                        wsize5,
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      'Pickup Details',
                                      style: poppinsBg,
                                    ),
                                    Container(
                                      width: 180.w,
                                      child: Text(order.pickupAddreess,
                                        style: addInter,
                                      ),
                                    ),
                                    ksize5,
                                    ksize2,
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      'Delivery Details',
                                      style: poppinsBg,
                                    ),
                                    SizedBox(
                                        width: 100.w),
                                    Container(
                                      width: 180.w,
                                      child: Text(order.bookingDeliveryAddresses.first.address,
                                        style: addInter,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            ksize5,
                            ksize2,
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 120.h,
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceEvenly,
                        children: [
                          Container(
                              width:80.w,
                              child: Text('$pickupstarttime to $pickupentime', style: MyFonts.interBG)),
                          ksize20,
                          Container(
                              width:80.w,
                              child: Text('$dropstarttime to $dropendtime', style: MyFonts.interBG)),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height:50.h,
                        width:147.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          border: Border.all(width: 1,color: Colors.grey.shade400),// Background color of the container
                          borderRadius: BorderRadius.circular(15), // Adjust the value for more or less rounding
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Earned',style: inter1.copyWith(color: AppColors.dolorGreen,fontSize: 13.sp,fontWeight: FontWeight.w700),),
                            wsize5,
                            Text('\$${order.totalAmount}',style: inter1.copyWith(color: AppColors.dolorGreen,fontWeight: FontWeight.bold,fontSize: 13.sp),),


                          ],
                        ) // Add your child widgets here
                    ),
                    Container(
                        height:50.h,
                        width:145.w,
                        decoration: BoxDecoration(
                          color: Colors.green.shade600, // Background color of the container
                          borderRadius: BorderRadius.circular(15), // Adjust the value for more or less rounding
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.verified,color: Colors.white,),
                            wsize5,
                            Text('Completed',style: inter1.copyWith(color: AppColors.white,fontWeight: FontWeight.w800,fontSize: 13),),


                          ],
                        ) // Add your child widgets here
                    ),

                  ],
                ),
                ksize5,
              ],
            ),
          ),
        );
      }
      );
      });
  }
}
