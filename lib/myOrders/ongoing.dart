import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veelgo/modelClasses/ongoing_orders.dart';
import '../network/controllers/auth_api_controllers.dart';
import '../properties/common properties.dart';
import 'package:intl/intl.dart';


class Ongoing extends StatefulWidget {
  const Ongoing({super.key});

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  final AuthControllers authController = Get.put(AuthControllers());

  @override
  void initState() {
    super.initState();
    // Optionally, you can trigger the fetch here if not done in the controller
    authController.fetchOngoingOrders("ongoing");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.ongoingload.value) {
        return const Center(child: CircularProgressIndicator(color: Colors.grey,));
      } else if (authController.orderslist.isEmpty) {
        return const Center(child: Text('No ongoing orders'));
      }
      return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: authController.orderslist.length,
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
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Booking ID: ${order.bookingId}', style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 15)),
                        Text('Ongoing', style: inter1.copyWith(fontWeight: FontWeight.w700, color: Colors.orange)),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1, endIndent: 1),
                  ksize5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Container(
                              child: Column(
                                children: [
                                  Icon(Icons.location_on, size: 20.sp, color: const Color(0xff038484)),
                                  Dash(direction: Axis.vertical, length: 50.h, dashLength: 5, dashColor: AppColors.primaryColor),
                                  Icon(Icons.location_on, size: 20.sp, color: const Color(0xffF74354)),
                                ],
                              ),
                            ),
                          ),
                          wsize5,
                          wsize5,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Pickup Details', style: poppinsBg),
                                      Container(
                                        width: 180.w,
                                        child: Text(
                                          order.pickupAddreess, // Accessing pickup address
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Delivery Details', style: poppinsBg),
                                  Container(
                                    width: 180.w,
                                    child: Text(
                                      order.bookingDeliveryAddresses.first.address, // Accessing delivery address
                                      style: addInter,
                                    ),
                                  ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width:80.w,
                                child: Text('$pickupstarttime to $pickupentime', style: MyFonts.interBG)),
                            ksize20,
                            Container(
                                width:80.w,
                                child: Text('$pickupstarttime to $pickupentime', style: MyFonts.interBG)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
