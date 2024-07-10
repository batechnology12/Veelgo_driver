import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veelgo/chatScreen/two.dart';
import 'package:veelgo/properties/common%20properties.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child:  Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 15.sp,
              color: Colors.white,
            ),
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              "assets/pro.png",
              height: 40.h,
              width: 40.w,
            ),
            wsize10,

            Column(
              children: [
                Text(
                  "Lee Wong",
                  style: inter1.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp),
                ),
                Text(
                  "Van Driver",
                  style: inter1.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp),
                ),
              ],
            )
          ],
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  child: SvgPicture.asset(
                    'assets/wtsapplogo.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Uri phoneno = Uri.parse('tel:');
                  if (await launchUrl(phoneno)) {
                  //dialer opened
                  }else{
                  //dailer is not opened
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 32.h,
                    width: 32.w,
                    child: SvgPicture.asset(
                      'assets/chatphn.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            ],
          )

        ],
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
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
                margin: EdgeInsets.only(top: 10.h),
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  //  color: Color.fromARGB(255, 235, 232, 232),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ksize10,
                        ksize10,
                        ListView.builder(
                          itemCount: driverMessages.length,
                          reverse: true,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment:
                              driverMessages[index].messageType ==
                                  "receiver"
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              children: [
                                driverMessages[index].messageType == "receiver"
                                    ? Row(
                                  mainAxisAlignment:
                                  driverMessages[index].messageType ==
                                      "receiver"
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      child: Row(
                                       mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            driverMessages[index].image,
                                            height: 35,
                                            width: 35,
                                          ),
                                         wsize10,
                                          Text(
                                            driverMessages[index]
                                                .driverName,
                                            style: inter1.copyWith(
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.w600,
                                                fontSize: 15.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    wsize10,
                                    Row(

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10),
                                          child: Text(
                                            driverMessages[index].time,
                                            style: inter1.copyWith(
                                                color: Colors.grey,
                                                fontWeight:
                                                FontWeight.w700,
                                                fontSize: 10.sp),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                                    : Row(
                                        mainAxisAlignment:
                                       driverMessages[index].messageType !=
                                      "receiver"
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10),
                                          child: Text(
                                            driverMessages[index].time,
                                            style: inter1.copyWith(
                                                color: Colors.grey,
                                                fontWeight:
                                                FontWeight.w700,
                                                fontSize: 10.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(

                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            driverMessages[index]
                                                .driverName,
                                            style: inter1.copyWith(
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.w600,
                                                fontSize: 15.sp),
                                          ),
                                          wsize10,
                                          Image.asset(
                                            driverMessages[index].image,
                                            height: 30,
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    driverMessages[index].messageType ==
                                        "receiver"
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(

                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.7,
                                          ),
                                          decoration: BoxDecoration(

                                              border: Border.all(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.only(
                                                  topRight: driverMessages[
                                                  index]
                                                      .messageType ==
                                                      "receiver"
                                                      ? Radius.circular(20)
                                                      : Radius.circular(0),
                                                  bottomLeft:
                                                  Radius.circular(20),
                                                  bottomRight:
                                                  Radius.circular(20),
                                                  topLeft: driverMessages[index]
                                                      .messageType ==
                                                      "receiver"
                                                      ? Radius.circular(0)
                                                      : Radius.circular(20)),
                                              color:Colors.grey.shade50),
                                          padding: const EdgeInsets.all(16),
                                          margin:
                                          const EdgeInsets.symmetric(vertical: 4),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              driverMessages[index].massage,
                                              style: inter1.copyWith(
                                                  decoration:
                                                  TextDecoration.none,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.sp),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                ksize10,
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15, top: 15, bottom: 20), // Adjust padding as needed
                hintText: "Type a message here...",
                hintStyle: inter1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color
                border: OutlineInputBorder(

                  borderSide: BorderSide.none, // No border side
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 3, right: 5),
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: Color(0xff0000000),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings_voice_outlined,
                        color: AppColors.white,
                        size: 22.h,
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
  }
}