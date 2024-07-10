import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../properties/common properties.dart';
import 'addDriverDoc.dart';


class RealUpdateNIRC extends StatefulWidget {
  const RealUpdateNIRC({super.key});

  @override
  State<RealUpdateNIRC> createState() => _RealUpdateNIRCState();
}

class _RealUpdateNIRCState extends State<RealUpdateNIRC> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new_outlined,size: 16.sp,)),
        title: Text(
          'Update vehicles',
          style: poppins1.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Update Profile Picture',
                      style: inter1.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      )),
                  ksize10,
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/tick.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Update NIRC front picture',
                        style: inter1.copyWith(
                            fontSize: 13.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  ksize10,
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/tick.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The Selfie Should have the applicants face alone',
                              style: inter1.copyWith(
                                  fontSize: 13.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ksize10,
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/tick.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Upload PDF / JPEG / PNG',
                        style: inter1.copyWith(
                            fontSize: 13.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: sHeight / 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              color: Colors.grey.shade400,
              thickness: 1,
              indent: 18,
              endIndent: 18,
            ),
          ),
          SizedBox(height: sHeight / 70),
          GestureDetector(
            onTap: () => _showBottomSheet(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sWidth / 25),
              child: Container(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 90.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lytBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DottedBorder(
                    color: Colors.blue,
                    strokeWidth: 1,
                    dashPattern: const [6, 2],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/licensepic.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Upload NRIC Front Picture',
                            style: inter1.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ksize5,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: _selectedImage != null
                  ? Stack(children: [
                SizedBox(
                  width: 90.h, // Adjust the width as needed
                  height: 90.w, // Adjust the height as needed
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(10), // Adjust the border radius as needed
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -8,
                  right: -5,
                  child: IconButton(
                    icon: const Icon(
                      Icons.cancel_rounded,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedImage = null; // Clear the selected image
                      });
                    },
                  ),
                ),
              ])
                  : const SizedBox.shrink()),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            height: 46.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedImage != null) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return WillPopScope(
                        onWillPop: () async {
                          // Return false to prevent the back button from closing the dialog
                          return false;
                        },
                        child: AlertDialog(
                          title:  Text('Update NRIC',style: inter1.copyWith(fontWeight: FontWeight.w900,fontSize: 20.sp),),
                          content:  Text('Updated successfully!',style: poppins1.copyWith(fontWeight: FontWeight.w900,fontSize: 14.sp,color: AppColors.primaryColor),),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.offAll(const UpdateDocuments());
                               // Get.offAll(UpdateNIRC());
                              },
                              child: Container(

                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                                    child:  Text('OK',style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700,color: AppColors.primaryColor),),
                                  )),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  SnackbarUtils.showSnackbar(context, 'Please Update NRIC picture');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'Submit',
                    style: inter1.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
