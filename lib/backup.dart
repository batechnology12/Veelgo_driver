//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_dash/flutter_dash.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// import '../../controller/authController.dart';
// import '../../properties/common properties.dart';
//
// class MyOrder extends StatefulWidget {
//   const MyOrder({super.key});
//
//   @override
//   State<MyOrder> createState() => _MyOrderState();
// }
//
// class _MyOrderState extends State<MyOrder> {
//   final authController = Get.put(AuthController());
//   bool ischeck = false;
//
//   bool ishide = false;
//   bool confirnhide = false;
//   var nameController = TextEditingController();
//   var mobileController = TextEditingController();
//   var passwordController = TextEditingController();
//   var confirmpasswordController = TextEditingController();
//   var emailController = TextEditingController();
//
//   bool ischecked = false;
//
//   bool ishiding = false;
//   bool confirmhide = false;
//
//   var companynameController = TextEditingController();
//   var businessphoneController = TextEditingController();
//   var businessemailidController = TextEditingController();
//   var contactPersonController = TextEditingController();
//   var industryController = TextEditingController();
//   var parcelController = TextEditingController();
//   var businnesspasswordsController = TextEditingController();
//   var bussinessConfirmpasswordsController = TextEditingController();
//
//   final formKey1 = GlobalKey<FormState>();
//   final formKey2 = GlobalKey<FormState>();
//   final formKey3 = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColors.lytBlue,
//       body: Container(
//           width: double.infinity,
//           height: size.height,
//           decoration: BoxDecoration(
//             color: AppColors.primaryColor,
//             gradient: LinearGradient(
//               colors: [
//                 Colors.grey.shade50,
//                 AppColors.white,
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Obx(() => Stack(
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     height: size.height * 0.16,
//                     decoration: const BoxDecoration(
//                         color: AppColors.primaryColor,
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(17),
//                             bottomRight: Radius.circular(17))),
//                   ),
//                   Expanded(
//                     //  flex: 4,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           boxShadow: const <BoxShadow>[
//                             BoxShadow(
//                                 offset: Offset(0.0, 0.80),
//                                 color: AppColors.primaryColor)
//                           ],
//                           color: Colors.grey.shade50,
//                         ),
//                       ))
//                 ],
//               ),
//               Positioned(
//                 top: 50,
//                 right: 150,
//                 child: Center(
//                   child: Text(
//                     'Assign Tasks',
//                     style: inter1.copyWith(
//                         fontSize: 17.sp,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.white),
//                   ),
//                 ),
//               ),
//               ksize10,
//               if (authController.containerindex.value == 0)
//                 Form(
//                   key: formKey1,
//                   child: Positioned(
//                       top: 160.h,
//                       left: 10,
//                       right: 10,
//                       child: Container(
//
//                         color: Colors.grey.shade100,
//                         height: size.height - 120,
//                         child: ListView.builder(
//                           padding: EdgeInsets.zero,
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           itemCount: 6, // Number of items
//                           itemBuilder: (context, index) {
//                             return Container(
//                               padding: const EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.withOpacity(.09),
//                                 borderRadius:
//                                 BorderRadius.circular(10),
//                               ),
//                               margin:
//                               const EdgeInsets.only(bottom: 10),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text('Booking ID: #ZAGO1',style:inter1.copyWith(fontWeight: FontWeight.w800,fontSize: 15),),
//                                       Text('Ongoing',style: inter1.copyWith(fontWeight: FontWeight.w700,color: Colors.orange),),
//                                     ],),
//                                   ksize10,
//                                   Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                             const EdgeInsets.only(
//                                                 bottom: 30),
//                                             child: Container(
//                                               child: Column(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.location_on,
//                                                     size: 20.sp,
//                                                     color: const Color(
//                                                         0xff038484),
//                                                   ),
//                                                   Dash(
//                                                     direction:
//                                                     Axis.vertical,
//                                                     length: 70.h,
//                                                     dashLength: 5,
//                                                     dashColor: AppColors
//                                                         .primaryColor,
//                                                   ),
//                                                   Icon(
//                                                     Icons.location_on,
//                                                     size: 20.sp,
//                                                     color:
//                                                     const Color(0xffF74354),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           wsize5,
//                                           wsize5,
//                                           Column(
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     crossAxisAlignment:
//                                                     CrossAxisAlignment
//                                                         .start,
//                                                     children: [
//                                                       Text(
//                                                         'Pickup Details',
//                                                         style: poppinsBg,
//                                                       ),
//                                                       Container(
//                                                         width: 180.w,
//                                                         child: Text(
//                                                           'Jagadheshwar 338C Anchorvale Cresent, 543338',
//                                                           style: addInter,
//                                                         ),
//                                                       ),
//                                                       ksize5,
//                                                       ksize2,
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(height: 12.h),
//                                               Column(
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment
//                                                     .start,
//                                                 children: [
//                                                   Column(
//                                                     crossAxisAlignment:
//                                                     CrossAxisAlignment
//                                                         .start,
//                                                     children: [
//                                                       Text(
//                                                         'Delivery Details',
//                                                         style: poppinsBg,
//                                                       ),
//                                                       SizedBox(
//                                                           width: 100.w),
//                                                       Container(
//                                                         width: 180.w,
//                                                         child: Text(
//                                                           'Lee wong, 338C Anchorvale Cresent, 543338',
//                                                           style: addInter,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                               ksize5,
//                                               ksize2,
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       Container(
//                                         height: 175.h,
//                                         child: Column(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceEvenly,
//                                           children: [
//                                             Text(
//                                               '3pm to 4pm',
//                                               style: MyFonts.interBG,
//                                             ),
//                                             ksize20,
//                                             Text(
//                                               '3pm to 4pm',
//                                               style: MyFonts.interBG,
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       )),
//                 ),
//               if (authController.containerindex.value == 1)
//                 Form(
//                   key: formKey2,
//                   child: Positioned(
//                       top: 160.h,
//                       left: 10,
//                       right: 10,
//                       child: Container(
//                         color: Colors.red,
//                         height: size.height - 130,
//                         child: const SingleChildScrollView(
//                           physics: AlwaysScrollableScrollPhysics(),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [],
//                           ),
//                         ),
//                       )),
//                 ),
//               if (authController.containerindex.value == 2)
//                 Form(
//                   key: formKey3,
//                   child: Positioned(
//                       top: 160.h,
//                       left: 10,
//                       right: 10,
//                       child: Container(
//                         color: Colors.grey,
//                         height: size.height - 130,
//                         child: const SingleChildScrollView(
//                           physics: AlwaysScrollableScrollPhysics(),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [],
//                           ),
//                         ),
//                       )),
//                 ),
//               Positioned(
//                 top: size.height * .13,
//                 left: 13,
//                 right: 13,
//                 child: Container(
//                   height: 45.h,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade300,
//                       borderRadius: BorderRadius.circular(35)),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         wsize2,
//                         InkWell(
//                           onTap: () {
//                             authController.containerindex(0);
//                             authController.update();
//                           },
//                           child: Container(
//                             height: 35.h,
//                             width: 97.w,
//                             decoration: BoxDecoration(
//                                 color:
//                                 authController.containerindex.value == 0
//                                     ? AppColors.primaryColor
//                                     : Colors.grey.shade100,
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: Center(
//                                 child: Text(
//                                   'Ongoing',
//                                   style: inter1.copyWith(
//                                       color:
//                                       authController.containerindex.value ==
//                                           0
//                                           ? AppColors.white
//                                           : Colors.black,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 13.sp),
//                                 )),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             authController.containerindex(1);
//                             authController.update();
//                           },
//                           child: Container(
//                             height: 35.h,
//                             width: 97.w,
//                             decoration: BoxDecoration(
//                                 color:
//                                 authController.containerindex.value == 1
//                                     ? AppColors.primaryColor
//                                     : Colors.grey.shade100,
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: Center(
//                                 child: Text(
//                                   'Completed',
//                                   style: inter1.copyWith(
//                                       color:
//                                       authController.containerindex.value ==
//                                           1
//                                           ? AppColors.white
//                                           : Colors.black,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14.sp),
//                                 )),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             authController.containerindex(2);
//                             authController.update();
//                           },
//                           child: Container(
//                             height: 35.h,
//                             width: 97.w,
//                             decoration: BoxDecoration(
//                                 color:
//                                 authController.containerindex.value == 2
//                                     ? AppColors.primaryColor
//                                     : Colors.grey.shade100,
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: Center(
//                                 child: Text(
//                                   'Cancelled',
//                                   style: inter1.copyWith(
//                                       color:
//                                       authController.containerindex.value ==
//                                           2
//                                           ? AppColors.white
//                                           : Colors.black,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14.sp),
//                                 )),
//                           ),
//                         ),
//                         wsize2,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ))),
//     );
//   }
// }
//-------myorder--working copde


//-----updatevehicles correct code
// import 'dart:io';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../commonClasses.dart';
// import '../../properties/common properties.dart';
// import 'addDriverDoc.dart';
//
// class RealUpdateVehicleDetails extends StatefulWidget {
//   const RealUpdateVehicleDetails({super.key});
//
//   @override
//   State<RealUpdateVehicleDetails> createState() => _RealUpdateVehicleDetailsState();
// }
//
// class _RealUpdateVehicleDetailsState extends State<RealUpdateVehicleDetails> {
//   File? _selectedDrivingImage;
//   File? _selectedVehicleImage;
//   List<File>? _selectedLicenseImages = [];
//   List<File>? _selectedVehicleImages = [];
//   TextEditingController vehicleTypeController = TextEditingController();
//   TextEditingController vehicleModelController = TextEditingController();
//   TextEditingController vehicleNumberController = TextEditingController();
//
//
//
//
//
//   void _addImages(List<File> images, bool isLicense) {
//     setState(() {
//       if (isLicense) {
//         _selectedLicenseImages!.addAll(images);
//       } else {
//         _selectedVehicleImages!.addAll(images);
//       }
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     final size = MediaQuery.of(context).size;
//     final sWidth = size.width;
//     final sHeight = size.height;
//
//
//
//     void _showBottomSheet(BuildContext context, bool isLicense) {
//       showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return Container(
//             height: 120.h,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ListTile(
//                   leading: const Icon(Icons.photo_library),
//                   title: const Text('Photo Library'),
//                   onTap: () async {
//                     final List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();
//                     if (pickedFiles != null && pickedFiles.isNotEmpty) {
//                       List<File> files = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
//                       _addImages(files, isLicense);
//                     }
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.photo_camera),
//                   title: const Text('Camera'),
//                   onTap: () async {
//                     final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
//                     if (pickedFile != null) {
//                       final file = File(pickedFile.path);
//                       _addImages([file], isLicense);
//                     }
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//             onTap: (){
//               Get.back();
//             },
//             child: Icon(Icons.arrow_back_ios_new_outlined,size: 16.sp,)),
//         title: Text(
//           'Update vehicles',
//           style: poppins1.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ksize10,
//                   Text('Update Vehicle Details', style: inter1.copyWith(
//                     fontSize: 17.sp,
//                     fontWeight: FontWeight.bold,
//                   )),
//                   ksize20,
//                   Text('Select Vehicle Type *', style: interMedi),
//                   ksize5,
//                   CustomTextFormField(controller: vehicleTypeController),
//                   ksize10,
//                   Text('Vehicle Model *', style: interMedi),
//                   ksize5,
//                   CustomTextFormField(controller: vehicleModelController),
//                   ksize10,
//                   Text('Vehicle Number *', style: interMedi),
//                   ksize5,
//                   CustomTextFormField(controller: vehicleNumberController),
//                   ksize20,
//                   Text('Update DR & Vehicle Picture',  style: inter1.copyWith(
//                     fontSize: 17.sp,
//                     fontWeight: FontWeight.bold,
//                   )),
//                   ksize10,
//
//                   Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           GestureDetector(
//                             onTap: () => _showBottomSheet(context, true),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5.w),
//                               child: Container(
//                                 padding: const EdgeInsets.all(2.0),
//                                 child: Container(
//                                   height: 80.h,
//                                   width: 120.w,
//                                   decoration: BoxDecoration(
//                                     color: Colors.lightBlue[50],
//                                   ),
//                                   child: DottedBorder(
//                                     color: AppColors.primaryColor,
//                                     strokeWidth: 1,
//                                     dashPattern: const [6, 2],
//                                     child: Center(
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           SvgPicture.asset(
//                                             'assets/licensepic.svg',
//                                             height: 20.h,
//                                             width: 40.w,
//                                           ),
//                                           SizedBox(height: 2.w),
//                                           Text(
//                                             'Upload Driving License\nFront & Back',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               color: AppColors.primaryColor,
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () => _showBottomSheet(context, false),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5.w),
//                               child: Container(
//                                 padding: const EdgeInsets.all(2.0),
//                                 child: Container(
//                                   height: 80.h,
//                                   width: 120.w,
//                                   decoration: BoxDecoration(
//                                     color: Colors.lightBlue[50],
//                                   ),
//                                   child: DottedBorder(
//                                     color: AppColors.primaryColor,
//                                     strokeWidth: 1,
//                                     dashPattern: const [6, 2],
//                                     child: Center(
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           SvgPicture.asset(
//                                             'assets/licensepic.svg',
//                                             height: 20.h,
//                                             width: 40.w,
//                                           ),
//                                           const SizedBox(height: 2),
//                                           Text(
//                                             'Upload Vehicle Front & Back\nPicture',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               color: AppColors.primaryColor,
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       _buildImageGrid(),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 70.h,
//         child: Padding(
//           padding: EdgeInsets.all(12),
//           child: SizedBox(
//             height: 46.h,
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_selectedDrivingImage != null && _selectedVehicleImage != null) {
//                   showDialog(
//                     context: context,
//                     barrierDismissible: false,
//                     builder: (BuildContext context) {
//                       return WillPopScope(
//                         onWillPop: () async {
//                           // Return false to prevent the back button from closing the dialog
//                           return false;
//                         },
//                         child: AlertDialog(
//                           title:  Text('Update Vehicle Details',style: inter1.copyWith(fontWeight: FontWeight.w900,fontSize: 20.sp),),
//                           content:  Text('Updated successfully!',style: poppins1.copyWith(fontWeight: FontWeight.w900,fontSize: 14.sp,color: AppColors.primaryColor),),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Get.offAll(const UpdateDocuments());
//                                 // Get.offAll(UpdateNIRC());
//                               },
//                               child: Container(
//
//                                   decoration: BoxDecoration(
//                                     color: Colors.blue.shade100,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Padding(
//                                     padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
//                                     child:  Text('OK',style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700,color: AppColors.primaryColor),),
//                                   )),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 } else {
//                   SnackbarUtils.showSnackbar(context, 'Please Update NRIC picture');
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: AppColors.primaryColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Text(
//                     'Submit',
//                     style: inter1.copyWith(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 14.sp,
//                       color: Colors.white,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildImageGrid() {
//     List<File> allImages = [...?_selectedLicenseImages, ...?_selectedVehicleImages];
//     return allImages.isNotEmpty
//         ? Wrap(
//       children: allImages
//           .map((file) => Stack(
//         children: [
//           Container(
//             width: 70.h, // Adjust the width as needed
//             height: 70.w,
//             margin: const EdgeInsets.all(8),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.file(
//                 file,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             top: -10,
//             right: -8,
//             child: IconButton(
//               icon: const Icon(Icons.cancel, color: Colors.red),
//               onPressed: () {
//                 setState(() {
//                   if (_selectedLicenseImages!.contains(file)) {
//                     _selectedLicenseImages!.remove(file);
//                   } else if (_selectedVehicleImages!.contains(file)) {
//                     _selectedVehicleImages!.remove(file);
//                   }
//                 });
//               },
//             ),
//           ),
//         ],
//       ))
//           .toList(),
//     )
//         : const SizedBox.shrink();
//   }
//
// }






//-----------------
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:veelgo/properties/common%20properties.dart';

import '../../account/FAQ.dart';
import '../../account/chat.dart';
import '../../account/invoice.dart';
import '../../account/logOut.dart';
import '../../account/manageDriver.dart';
import '../../account/myProfile.dart';
import '../../account/referFriends.dart';
import '../../account/reviewRate.dart';
import '../../account/settings.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late List<Map<String, dynamic>> items;
  @override
  void initState() {
    super.initState();
    items = [
      {
        'icon': 'assets/man.png',
        'text': 'My Profile',
        'route': AccountMyProfile()
      },
      {
        'icon': 'assets/driver_out.png',
        'text': 'Manage Driver',
        'route': ManageDriver()
      },
      {
        'icon': 'assets/setting_out.png',
        'text': 'Settings',
        'route': AccountSettings()
      },
      {
        'icon': 'assets/faq_out.png',
        'text': 'FAQ',
        'route': AccountFAQ()
      },
      {
        'icon': 'assets/chat_out.png',
        'text': 'Chat',
        'route': const ChatScreen()
      },
      {
        'icon': 'assets/invoice_out.png',
        'text': 'Invoice',
        'route': AccountInvoice()
      },
      {
        'icon': 'assets/reff_out.png',
        'text': 'Refer Friends',
        'route': const ReferFriends()
      },
      {
        'icon': 'assets/review_out.png',
        'text': 'Review Rate',
        'route': _showReviewRateDialog,
      },
      {
        'icon': 'assets/logout_out.png',
        'text': 'Logout',
        'route': _showDeleteAccountBottomSheet,
      },
    ];
  }

  void _showDeleteAccountBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'LogOut',
                style: inter1.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Are you sure you want to LogOut?',
                style: inter1.copyWith(fontSize: 14.sp, color: AppColors.bluegrey, fontWeight: FontWeight.w900),
              ),
              ksize20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 120.w,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add delete account logic here
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.white), // Replace with your desired color
                      ),
                      child: Text('Cancel', style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: AppColors.primaryColor)),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 120.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor), // Replace with your desired color
                      ),
                      child: Text('Yes, LogOut', style: inter1.copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white)),
                    ),
                  ),
                ],
              ),
              ksize20,
            ],
          ),
        );
      },
    );
  }

  void _showReviewRateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Review Rate'),
          content: const Text('This is where you can review the rate.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        toolbarHeight: 150.h,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My Account',
              style: inter1.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
            ksize20,
            Row(
              children: [
                CircleAvatar(
                  radius: 30.sp, // Reduced size
                  child: Image.asset(
                    'assets/profilepic2.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jagatheshwar',
                      style: poppins1.copyWith(fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    ksize5,
                    Text(
                      'Vehicle Driver',
                      style: inter1.copyWith(fontSize: 14.sp, color: Colors.white, letterSpacing: 1),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Image.asset(
                  items[index]['icon'],
                  width: 20.w, // Set the desired width
                  height: 20.h, // Set the desired height
                ),
                title: Text(items[index]['text'],style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.bold),),
                onTap: () {
                  if (items[index]['text'] == 'Review Rate') {
                    _showReviewRateDialog(context);
                  } else if (items[index]['route'] != null) {
                    if (items[index]['route'] is VoidCallback) {
                      items[index]['route']();
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => items[index]['route'],
                        ),
                      );
                    }
                  }
                },
              ),
              Divider(
                indent: 20,
              ), // Add divider between items
            ],
          );
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_dash/flutter_dash.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:location/location.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// import '../../properties/common properties.dart';

// class PickupDrop extends StatefulWidget {
//   @override
//   State<PickupDrop> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<PickupDrop> {
//   late GoogleMapController _controller;
//   final Set<Marker> _markers = {};
//   late LocationData _currentPosition;
//   Location location = Location();
//
//   static const CameraPosition _initialPosition = CameraPosition(
//     target: LatLng(37.7749, -122.4194), // San Francisco
//     zoom: 12,
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _getLocation();
//   }
//
//   void _getLocation() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//
//     _currentPosition = await location.getLocation();
//     location.onLocationChanged.listen((LocationData currentLocation) {
//       _currentPosition = currentLocation;
//       _controller.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target:
//           LatLng(_currentPosition.latitude!, _currentPosition.longitude!),
//           zoom: 14.0,
//         ),
//       ));
//       setState(() {
//         _markers.add(Marker(
//           markerId: MarkerId('currentLocation'),
//           position:
//           LatLng(_currentPosition.latitude!, _currentPosition.longitude!),
//           infoWindow: InfoWindow(title: 'Your Location'),
//         ));
//       });
//     });
//   }
//
//   bool ischecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_new_sharp,
//             color: AppColors.white,
//           ),
//         ),
//         title: Text(
//           'Address Details',
//           style: inter1.copyWith(
//               fontSize: 20.sp,
//               color: AppColors.white,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: Stack(
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             child: Container(
//               height: size.height,
//               width: size.width,
//               child: GoogleMap(
//                 initialCameraPosition: _initialPosition,
//                 markers: _markers,
//                 myLocationEnabled: true,
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller = controller;
//                 },
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }


// Timer(Duration(seconds: 2), () {
// setState(() {
// _isLoading = false;
// });
// showModalBottomSheet(
// context: context,
// isScrollControlled: true,
// builder: (BuildContext context) {
// return const LocationOne();
// },
// );
// });


// Assuming you have a method to fetch data with authentication -----api token commonly
// Future<void> fetchData() async {
//   try {
//     String? token = await _apiProvider.getToken();
//     if (token == null) {
//       throw Exception("Token is null or not available");
//     }
//
//     var response = await _apiProvider.getWithToken('endpoint'); // Replace 'endpoint' with your actual API endpoint
//
//     if (response.statusCode == 200) {
//       // Handle successful response
//       print('Data: ${response.body}');
//     } else {
//       // Handle other status codes if needed
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error fetching data: $e');
//   }
// }
