import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../commonClasses.dart';
import '../../properties/common properties.dart';
import 'addDriverDoc.dart';

class RealUpdateVehicleDetails extends StatefulWidget {
  const RealUpdateVehicleDetails({super.key});

  @override
  State<RealUpdateVehicleDetails> createState() => _RealUpdateVehicleDetailsState();
}

class _RealUpdateVehicleDetailsState extends State<RealUpdateVehicleDetails> {
  File? _selectedDrivingImage;
  File? _selectedVehicleImage;
  List<File>? _selectedLicenseImages = [];
  List<File>? _selectedVehicleImages = [];
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController vehicleModelController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void _addImages(List<File> images, bool isLicense) {
    setState(() {
      if (isLicense) {
        _selectedLicenseImages!.addAll(images);
      } else {
        _selectedVehicleImages!.addAll(images);
      }
    });
  }


  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;



    void _showBottomSheet(BuildContext context, bool isLicense) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 120.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () async {
                    final List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();
                    if (pickedFiles != null && pickedFiles.isNotEmpty) {
                      List<File> files = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
                      _addImages(files, isLicense);
                    }
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      final file = File(pickedFile.path);
                      _addImages([file], isLicense);
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ksize10,
                     Text('Update Vehicle Details', style: inter1.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    )),
                    ksize20,
                    Text('Select Vehicle Type *', style: interMedi),
                    ksize5,
                    CustomTextFormField(controller: vehicleTypeController,validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vehicle Type is required';
                      }
                      return null;
                    },),
                    ksize10,
                    Text('Vehicle Model *', style: interMedi),
                    ksize5,
                    CustomTextFormField(controller: vehicleModelController, validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vehicle Model is required';
                      }
                      return null;
                    },),
                    ksize10,
                    Text('Vehicle Number *', style: interMedi),
                    ksize5,
                    CustomTextFormField(controller: vehicleNumberController, validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vehicle Model is required';
                      }
                      return null;
                    },),
                    ksize20,
                     Text('Update DR & Vehicle Picture',  style: inter1.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    )),
                    ksize10,

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => _showBottomSheet(context, true),
                              child: Container(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 80.h,
                                  width: 140.w, // Increased width
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[50],
                                  ),
                                  child: DottedBorder(
                                    color: AppColors.primaryColor,
                                    strokeWidth: 1,
                                    dashPattern: const [6, 2],
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/licensepic.svg',
                                            height: 20.h,
                                            width: 40.w,
                                          ),
                                          ksize5,
                                          Text(
                                            'Upload Driving License Front & Back',
                                            textAlign: TextAlign.center,
                                            style: inter1.copyWith(
                                              color: AppColors.primaryColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            maxLines: 2, // Ensure text wraps properly
                                            overflow: TextOverflow.visible, // Ensure text overflow is handled
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _showBottomSheet(context, false),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Container(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 80.h,
                                    width: 140.w, // Increased width
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue[50],
                                    ),
                                    child: DottedBorder(
                                      color: AppColors.primaryColor,
                                      strokeWidth: 1,
                                      dashPattern: const [6, 2],
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/licensepic.svg',
                                              height: 20.h,
                                              width: 40.w,
                                            ),
                                           ksize5,
                                            Text(
                                              'Upload Vehicle Front & Back\nPicture',
                                              textAlign: TextAlign.center,
                                              style: inter1.copyWith(
                                                color: AppColors.primaryColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700,
                                              ),

                                              maxLines: 2, // Ensure text wraps properly
                                              overflow: TextOverflow.visible, // Ensure text overflow is handled
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        _buildImageGrid(),
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
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
                // Validate form fields
                bool isVehicleTypeEmpty = vehicleTypeController.text.isEmpty;
                bool isVehicleModelEmpty = vehicleModelController.text.isEmpty;
                bool isVehicleNumberEmpty = vehicleNumberController.text.isEmpty;

                if (isVehicleTypeEmpty || isVehicleModelEmpty || isVehicleNumberEmpty) {
                  SnackbarUtils.showSnackbar(
                    context,
                    'Please fill all the required fields',
                  );
                  return;
                }

                if (_selectedLicenseImages == null || _selectedLicenseImages!.isEmpty) {
                  SnackbarUtils.showSnackbar(
                    context,
                    'Please upload Driving License images',
                  );
                  return;
                }

                if (_selectedVehicleImages == null || _selectedVehicleImages!.isEmpty) {
                  SnackbarUtils.showSnackbar(
                    context,
                    'Please upload Vehicle images',
                  );
                  return;
                }

                // If all validations pass
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return WillPopScope(
                      onWillPop: () async {
                        return false;
                      },
                      child: AlertDialog(
                        title: Text('Update Vehicle Details',
                            style: inter1.copyWith(
                                fontWeight: FontWeight.w900, fontSize: 20.sp)),
                        content: Text('Updated successfully!',
                            style: poppins1.copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 14.sp,
                                color: AppColors.primaryColor)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.offAll(const UpdateDocuments());
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 5.h),
                                  child: Text('OK',
                                      style: inter1.copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryColor)),
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                );
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
      )

    );
  }

  Widget _buildImageGrid() {
    List<File> allImages = [...?_selectedLicenseImages, ...?_selectedVehicleImages];
    return allImages.isNotEmpty
        ? Wrap(
      children: allImages
          .map((file) => Stack(
        children: [
          Container(
            width: 70.h, // Adjust the width as needed
            height: 70.w,
            margin: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                file,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -10,
            right: -8,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5), // Adjust border color and width as needed
              ),
              child: IconButton(
                icon: const Icon(Icons.cancel, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (_selectedLicenseImages!.contains(file)) {
                      _selectedLicenseImages!.remove(file);
                    } else if (_selectedVehicleImages!.contains(file)) {
                      _selectedVehicleImages!.remove(file);
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ))
          .toList(),
    )
        : const SizedBox.shrink();
  }

}