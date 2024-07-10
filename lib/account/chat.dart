import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';


import '../properties/common properties.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool isSender = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      popUp();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.seaBlue,
        leading: GestureDetector(
            onTap:(){Get.back();},
            child: Icon(Icons.arrow_back_ios_new_outlined,size: 16.sp,)),
        centerTitle: true,
        title: Text('V Export Care',style: poppins1.copyWith(fontSize: 17.sp,fontWeight: FontWeight.w900),),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
          color: AppColors.seaBlue,
          gradient: LinearGradient(
            colors: [
              AppColors.seaBlue,
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
                  color: Color(0xffF4F8FF),
                  //  color: Color.fromARGB(255, 235, 232, 232),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Today",
                                    style: inter1.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              );
                            }),
                        ksize10,
                        ListView.builder(
                          itemCount: messages.length,
                          reverse: true,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment:
                              messages[index].messageType == "receiver"
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    messages[index].messageType ==
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
                                                0.5,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.seaBlue),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomLeft: messages[index]
                                                    .messageType ==
                                                    "receiver"
                                                    ? Radius.circular(0)
                                                    : Radius.circular(20),
                                                bottomRight: messages[index]
                                                    .messageType ==
                                                    "receiver"
                                                    ? Radius.circular(20)
                                                    : Radius.circular(0),
                                                topLeft: Radius.circular(20),
                                              ),
                                              color: const Color(0xffFFFFFF)),
                                          padding: EdgeInsets.all(16),
                                          margin:
                                          EdgeInsets.symmetric(vertical: 4),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              messages[index].chatMessage,
                                              style: inter1.copyWith(
                                                  decoration:
                                                  TextDecoration.none,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12.sp),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  child: Text(
                                    "9:00 PM",
                                    style: inter1.copyWith(
                                        decoration: TextDecoration.none,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp),
                                  ),
                                ),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              height: 80.h,
              width: size.width,
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          popUp();
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffC4E4FF)),
                          child: const Icon(
                            Icons.menu,
                            color: Color(0xff0072E8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 50.h,
                          width: 250.w,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadiusDirectional.circular(20),
                              color: AppColors.white),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding:  EdgeInsets.only(
                                    left: 15.w, top: 12,),
                                hintText: "Type Here...........",
                                hintStyle: inter1.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.sp),
                                border: InputBorder.none,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.send_sharp,
                                        color:  AppColors.primaryColor,
                                        size: 25.h,
                                      )),
                                )),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  popUp() {
    final size1 = MediaQuery.of(context).size;
    // bool isCheck = true;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(

              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration:  BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(15),),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                              child: Text(
                                "Quick Menu",
                                style: poppins1.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                          ksize20,
                          Text(
                            "Schedule change",
                            style: inter1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                                        ksize20,
                          Text(
                            "Book Another Cap",
                            style: inter1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                                        ksize20,
                          Text(
                            "Found a better Alternative",
                            style: inter1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                                        ksize20,
                          Text(
                            "Drive is taking too long",
                            style: inter1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                                        ksize20,
                          Text(
                            "My Reason is not listed",
                            style: inter1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                                        ksize20,
                        ],
                      ),
                    ),
                  ),
                  ksize10,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    height: 70.h,
                    width: size1.width,
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffC4E4FF)),
                                child: Icon(Icons.clear_rounded,color: AppColors.primaryColor,)
                                // child: const Icon(
                                //   Icons.cancel,
                                //   color: Color(0xff0072E8),
                                // ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                height: 50.h,
                                width: 260.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadiusDirectional.circular(20),
                                    color: AppColors.white),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding:  EdgeInsets.only(
                                        left: 15.w, top: 12,),
                                      hintText: "Type Here...........",
                                      hintStyle: inter1.copyWith(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14.sp),
                                      border: InputBorder.none,
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.send_sharp,
                                              color: AppColors.primaryColor,
                                              size: 25.h,
                                            )),
                                      )),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}



class ChatMessage {
  String chatMessage;

  String messageType;
  ChatMessage({
    required this.messageType,
    required this.chatMessage,
  });
}

List<ChatMessage> messages = [
  ChatMessage(
    messageType: "sender",
    chatMessage: 'Found a better alternative',
  ),
  ChatMessage(
    messageType: "receiver",
    chatMessage:
    'Lorem Ipsum is simply dummy text of the printing and type setting industry.',
  ),
];