import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veelgo/network/controllers/auth_api_controllers.dart';
import 'package:intl/intl.dart';
import 'package:veelgo/properties/common%20properties.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final AuthControllers homeScreenController = Get.put(AuthControllers());

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeScreenController.getNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.lytBlue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Notifications',
          style: inter1.copyWith(
            fontSize: 18.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
          color: AppColors.lytBlue,
          gradient: LinearGradient(
            colors: [
              AppColors.lytBlue,
              AppColors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17),
                  ),
                ),
                child: Obx(() {
                  return homeScreenController.notificationLoading.isTrue
                      ? const Center(child: Text('Loading Notifications'))
                      : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Today',
                                style: inter1.copyWith(
                                  color: const Color(0xff263238),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Mark all as read',
                                style: inter1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: homeScreenController.notificationList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green .shade200,
                                          ),
                                          child: Center(
                                            child: SizedBox(
                                                height: 20.h,
                                                width: 20.w,
                                                child: Image.asset("assets/tikgreen.png")),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7, top: 7),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                homeScreenController.notificationList[index].title,
                                                style: inter1.copyWith(
                                                  fontSize: 15.sp,
                                                  color: const Color(0xff263238),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Container(
                                                  width: 210.w,
                                                  child: Text(
                                                    homeScreenController.notificationList[index].description,
                                                    textAlign: TextAlign.start,
                                                    style: inter1.copyWith(
                                                      fontSize: 11.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: AppColors.bluegrey
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(DateFormat.jm().format(homeScreenController.notificationList[index].createdAt),)
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
