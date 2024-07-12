import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/commonClasses.dart';
import 'package:veelgo/login_reg_screens/register.dart';
import 'package:veelgo/login_reg_screens/successDoc.dart';
import 'package:veelgo/properties/common%20properties.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import '../apiCalls.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';




class UpdateProfile extends StatefulWidget {

   UpdateProfile({Key? key ,}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<bool> _dotsSelected = [true, false, false, false, false];
  File? _image;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  // final LoginApi _loginApi = LoginApi();
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
              Get.offAll( const Register());
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
        centerTitle: true,
        title: Text('Required Documents',style: inter1.copyWith(fontWeight: FontWeight.w700,fontSize:17.sp ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ksize10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    for (int i = 0; i <= index; i++) {
                      _dotsSelected[i] = true;
                    }
                    for (int i = index + 1; i < 5; i++) {
                      _dotsSelected[i] = false;
                    }
                    _currentPage = index;
                    _pageController.jumpToPage(index);
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 20.h,
                      width: 28.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _dotsSelected[index]
                            ? AppColors.primaryColor
                            : (index == _currentPage
                            ? AppColors.primaryColor
                            : Colors.grey),
                      ),
                      child: Center(
                        child: _dotsSelected[index] || index == _currentPage
                            ? (index == _currentPage
                            ? Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                            : Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 14.sp,
                        ))
                            : Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    if (index < 4)
                      Container(
                        width: 20.w,
                        child: const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
          ksize15,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Update Profile Picture',
                    style: inter1.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ksize10,
                  ksize2,
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/tick.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Please Upload a Clear Selfie',
                        style: inter1.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  ksize10,
                  ksize2,
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/tick.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Container(
                          child: Text(
                            'The Selfie Should have the applicants face alone',
                            style: inter1.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ksize10,
                  ksize2,
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
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              color: Colors.grey.shade400,
              thickness: 1,
              indent: 18,
              endIndent: 18,
            ),
          ),
          SizedBox(height: 10.h),
          GestureDetector(
            onTap: () => _showBottomSheet(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sWidth / 30),
              child: Container(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade50,
                  ),
                  child: DottedBorder(
                    color: Colors.blue,
                    strokeWidth: 1,
                    dashPattern: const [6, 3],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/licensepic.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Upload Profile Picture',
                            style: inter1.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
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
          SizedBox(height: 5.h),
          _selectedImage!= null
              ? Stack(children: [
                  Container(
                    width: 90.h, // Adjust the width as needed
                    height: 90.w, // Adjust the height as needed
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the border radius as needed
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
                      icon: const Icon(Icons.cancel_rounded, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _selectedImage = null; // Clear the selected image
                        });
                      },
                    ),
                  ),
                ])
              : const SizedBox.shrink(),
          // ElevatedButton(onPressed: (){_uploadImage;}, child: Text('upload'))

        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: SizedBox(
              height: 45.h,
              width: size.width,
              child: ElevatedButton(
                onPressed: () {
                  _selectedImage == null  ? SnackbarUtils.showSnackbar(context, 'Select profile picture'):
                  _uploadImage();
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor,
                  side: BorderSide(color: AppColors.primaryColor, width: 1.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Next',

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
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

  Future<void> _uploadImage() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
    try {

      // String? token = await _loginApi.getToken();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      print('token success');
      if (authtoken == null) {
        throw Exception('Token not found');
      }

      const String url =
          'https://veelgo.digitaldatatechnologia.in/api/update_profile_picture';
      var headers = {
        'Authorization': 'Bearer $authtoken',
        'Content-Type': 'form-data',
      };

      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath(
          'image',
          _selectedImage!.path,
        ));

      var response = await request.send();

      if (response.statusCode == 200) {
        Get.back();
        print(authtoken);
        var responseData = await response.stream.bytesToString();
        var decodedData = jsonDecode(responseData);
        String profilePictureUrl = decodedData['data']['profile_picture_url'];
        print(profilePictureUrl);
        print('Profile picture updated successfully: $profilePictureUrl');
        SnackbarUtils.showSnackbar(context, 'Updated Profile Successfully');
        Get.to(UpdateVehicleDetails());


        // Optionally, update UI or show a success message
      } else {
        Get.back();
        print('Failed to upload profile picture: ${response.statusCode}');
        SnackbarUtils.showSnackbar(context, 'Please select profile picture');
        // Handle error, show error message
      }
    } catch (e) {
      Get.back();
      print('Error uploading profile picture: $e');
      SnackbarUtils.showSnackbar(context, e.toString());
      // Handle exception, show error message
    }
  }


}

class UpdateVehicleDetails extends StatefulWidget {
  const UpdateVehicleDetails({super.key});

  @override
  State<UpdateVehicleDetails> createState() => _UpdateVehicleDetailsState();
}

class _UpdateVehicleDetailsState extends State<UpdateVehicleDetails> {
  List<Map<String, dynamic>> vehicleTypes = [];
   int? selectedId;
  final PageController _pageController = PageController();
  int _currentPage = 1;
  List<bool> _dotsSelected = [true, true, false, false, false];
  File? _image;

  Future<void> _fetchVehicleTypes() async {
    try {
      final response = await http.get(Uri.parse(
          'https://veelgo.digitaldatatechnologia.in/api/vehicle_types'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          setState(() {
            vehicleTypes = List<Map<String, dynamic>>.from(data['data']);
          });
        } else {
          // Handle API error or no data case
          print('Failed to load vehicle types');
        }
      } else {
        // Handle API error
        print('Failed to load vehicle types');
      }
    } catch (e) {
      // Handle network or decoding errors
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchVehicleTypes();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }
  final formKey = GlobalKey<FormState>();

  File? _drivingLicenseFront;
  File? _drivingLicenseBack;
  File? _vehicleFront;
  File? _vehicleBack;
  bool _isLoading = false;
  List<String> items = [];

  TextEditingController vehicleType = TextEditingController();
  TextEditingController vehicleModel = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();


  String _selectedVehicleType = 'Car';
  List<String> _vehicleTypes = ['Car', 'Bike', 'Truck'];



  String? dropdownValue;

  Future<void> _uploadVehicleDetails() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
    try {
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      // String? token = await _loginApi.getToken();
      if (authtoken == null) {
        throw Exception('Token not found');
      }


      const String url = 'https://veelgo.digitaldatatechnologia.in/api/store_vehicle';

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Authorization': 'Bearer $authtoken',
        'Content-Type': 'form-data',
      });

      // Add text fields
      request.fields['vehicle_type_id'] = selectedId.toString();
      request.fields['vehicle_model'] = vehicleModel.text;
      request.fields['vehicle_number'] = vehicleNumber.text;
      print(vehicleType.text);
      print('------------------------------');
      print(_drivingLicenseBack);
      print(_drivingLicenseFront);
      print(_vehicleFront);
      print(_vehicleBack);
      print('------------------------------');

      // Add images
      if (_drivingLicenseFront != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'driving_license_front',
          _drivingLicenseFront!.path,
        ));
      }
      if (_drivingLicenseBack != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'driving_license_back',
          _drivingLicenseBack!.path,
        ));
      }
      if (_vehicleFront != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'vehicle_front',
          _vehicleFront!.path,
        ));
      }
      if (_vehicleBack != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'vehicle_back',
          _vehicleBack!.path,
        ));
      }



      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true || response.statusCode == 201) {
        Get.back();

        print('Vehicle details updated successfully: $responseData');
        SnackbarUtils.showSnackbar(context, 'Vehicle details updated successfully');
        Get.to(const UpdateNIRC());
      } else {
        Get.back();

        if (responseData.containsKey('message')) {
          print('Failed to update pictures: ${responseData['message']}');
          SnackbarUtils.showSnackbar(context, 'Failed to update pictures: ${responseData['message']}');
        } else {
          print('Failed to update pictures: Unknown error');
          SnackbarUtils.showSnackbar(context, 'Failed to update pictures: Unknown error');
        }
      }

    } catch (e) {
      Get.back();
      print('Error updating vehicle details: $e');
      SnackbarUtils.showSnackbar(context, 'Error: ${e.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _pickImage(bool isDrivingLicenseFront, bool isDrivingLicenseBack, bool isVehicleFront, bool isVehicleBack) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        if (isDrivingLicenseFront) {
          _drivingLicenseFront = File(pickedImage.path);
        } else if (isDrivingLicenseBack) {
          _drivingLicenseBack = File(pickedImage.path);
        } else if (isVehicleFront) {
          _vehicleFront = File(pickedImage.path);
        } else if (isVehicleBack) {
          _vehicleBack = File(pickedImage.path);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          centerTitle: true,
          title: Text('Required Documents', style: inter1.copyWith(fontWeight: FontWeight.w700, fontSize: 17.sp)),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksize10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                for (int i = 0; i <= index; i++) {
                                  _dotsSelected[i] = true;
                                }
                                for (int i = index + 1; i < 5; i++) {
                                  _dotsSelected[i] = false;
                                }
                                _currentPage = index;
                                _pageController.jumpToPage(index);
                              });
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  height: 20.h,
                                  width: 28.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _dotsSelected[index]
                                        ? AppColors.primaryColor
                                        : (index == _currentPage
                                        ? AppColors.primaryColor
                                        : Colors.grey),
                                  ),
                                  child: Center(
                                    child: _dotsSelected[index] || index == _currentPage
                                        ? (index == _currentPage
                                        ? Text(
                                      (index + 1).toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                        : Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 14.sp,
                                    ))
                                        : Text(
                                      (index + 1).toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                if (index < 4)
                                  Container(
                                    width: 20.w,
                                    child: const Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }),
                      ),
                      ksize15,

                      ksize10,
                      Text('Update Vehicle Details', style: inter1.copyWith(fontSize: 17.sp, fontWeight: FontWeight.bold)),
                      ksize10,
                      Text('Select Vehicle Type *', style: inter1.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.bluegrey)),
                      ksize5,
                      // CustomTextFormField(controller: vehicleType, validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter vehicle type';
                      //   }
                      //
                      //   return null;
                      // }),
                      ksize10,
                    DropdownButtonFormField<int?>(
                      hint: Text('select vehicle type'),
                      validator: (selectedId) {
                        if (selectedId == null) {
                          return 'Choose vehicle ID';
                        }
                        return null;
                      },


                      onChanged: (int? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedId = newValue;
                          });
                        }
                        print('-------------------------');
                        print(selectedId);
                      },
                      items: vehicleTypes.map((Map<String, dynamic> vehicleType) {
                        return DropdownMenuItem<int?>(
                          value: vehicleType['id'],
                          child: Text('Vehicle Type ID: ${vehicleType['id']}'),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintStyle:  inter1.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: AppColors.primaryColor,
                            width: 0.1,
                          ),
                        ),
                      ),
                    ),
                      ksize10,
                      Text('Vehicle Model *', style: inter1.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.bluegrey)),
                      ksize5,
                      CustomTextFormField(
                          controller: vehicleModel,
                          validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter vehicle model';
                        }
                        return null;
                      }),
                      SizedBox(height: 16),

                      ksize10,
                      Text('Vehicle Number *', style: inter1.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.bluegrey)),
                      ksize5,
                      CustomTextFormField(controller: vehicleNumber, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter vehicle number';
                        }
                        return null;
                      }),
                      ksize10,
                      Text('Update DR & Vehicle Picture', style: inter1.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.bluegrey)),
                      ksize10,
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildImageContainer('Upload Driving License Front', _drivingLicenseFront, () => _pickImage(true, false, false, false)),
                              _buildImageContainer('Upload Driving License Back', _drivingLicenseBack, () => _pickImage(false, true, false, false)),
                            ],
                          ),
                          ksize10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildImageContainer('Upload Vehicle Front', _vehicleFront, () => _pickImage(false, false, true, false)),
                              _buildImageContainer('Upload Vehicle Back', _vehicleBack, () => _pickImage(false, false, false, true)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: SizedBox(
                height: 45.h,
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _drivingLicenseFront==null&&_drivingLicenseBack==null&&_vehicleFront==null&&_vehicleBack==null?
                      SnackbarUtils.showSnackbar(context, 'Please select images'): _uploadVehicleDetails();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    side: BorderSide(color: AppColors.primaryColor, width: 1.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer(String label, File? imageFile, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 80.h,
            width: 100.w,
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
                    imageFile != null
                        ? Image.file(imageFile, height: 40.h, width: 40.w, fit: BoxFit.cover)
                        : SvgPicture.asset(
                      'assets/licensepic.svg',
                      height: 20.h,
                      width: 40.w,
                    ),
                    SizedBox(height: 2.w),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: inter1.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateNIRC extends StatefulWidget {
  const UpdateNIRC({super.key});

  @override
  State<UpdateNIRC> createState() => _UpdateNIRCState();
}

class _UpdateNIRCState extends State<UpdateNIRC> {
  final PageController _pageController = PageController();
  int _currentPage = 2;
  List<bool> _dotsSelected = [true, true, true, false, false];
  File? _image;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  File? _selectedImage;
  // final LoginApi _loginApi = LoginApi();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Required Documents',style: inter1.copyWith(fontWeight: FontWeight.w700,fontSize:17.sp ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ksize10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            for (int i = 0; i <= index; i++) {
                              _dotsSelected[i] = true;
                            }
                            for (int i = index + 1; i < 5; i++) {
                              _dotsSelected[i] = false;
                            }
                            _currentPage = index;
                            _pageController.jumpToPage(index);
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              height: 20.h,
                              width: 28.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _dotsSelected[index]
                                    ? AppColors.primaryColor
                                    : (index == _currentPage
                                    ? AppColors.primaryColor
                                    : Colors.grey),
                              ),
                              child: Center(
                                child: _dotsSelected[index] || index == _currentPage
                                    ? (index == _currentPage
                                    ? Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                    : Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 14.sp,
                                ))
                                    : Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            if (index < 4)
                              Container(
                                width: 20.w,
                                child: const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                  ksize15,
                  Text('Update NRIC Picture',
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
                        child: Container(
                          child: Text(
                            'The Selfie Should have the applicants face alone',
                            style: inter1.copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.w600),
                          ),
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
                  ksize10,
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
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the border radius as needed
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
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: SizedBox(
              height: 45.h,
              width: size.width,
              child: ElevatedButton(
                onPressed: () {
                  _uploadNRIC();





                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor,
                  side: BorderSide(color: AppColors.primaryColor, width: 1.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Next',
                  // _currentPage < 4
                  //     ? 'Next'
                  //     : 'Submit', // Change text to 'Submit' when on the last page
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _uploadNRIC() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
    try {
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      print('token success');
      if (authtoken == null) {
        throw Exception('Token not found');
      }

      const String url =
          'https://veelgo.digitaldatatechnologia.in/api/update_nric_picture';
      var headers = {
        'Authorization': 'Bearer $authtoken',
        'Content-Type': 'form-data',
      };


      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath(
          'nric_picture',
          _selectedImage!.path,
        ));

      var response = await request.send();

      if (response.statusCode == 200) {
        print(authtoken);
        var responseData = await response.stream.bytesToString();
        var decodedData = jsonDecode(responseData);
        String profilePictureUrl = decodedData['data']['nric_picture_url'];
        print('Nric picture updated successfully: $profilePictureUrl');
        SnackbarUtils.showSnackbar(context, 'Updated NRIC Successfully');
        Get.to(UpdateAccount());

        // Optionally, update UI or show a success message
      } else {
        print('Failed to upload profile picture: ${response.statusCode}');
        SnackbarUtils.showSnackbar(context, 'Failed');
        // Handle error, show error message
      }
    } catch (e) {
      print('Error uploading profile picture: $e');
      SnackbarUtils.showSnackbar(context, e.toString());
      // Handle exception, show error message
    }
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
              // ListTile(
              //   leading: const Icon(Icons.camera_alt),
              //   title: const Text('Camera'),
              //   onTap: () {
              //     Navigator.pop(context);
              //     _pickImage(ImageSource.camera);
              //   },
              // ),
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

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({super.key});

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  final PageController _pageController = PageController();
  int _currentPage = 3;
  List<bool> _dotsSelected = [true, true, true, true, false];
  File? _image;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  // final LoginApi _loginApi = LoginApi();
  File? _selectedImage;
  final TextEditingController _banknameController = TextEditingController();
  final TextEditingController _accontNumberController = TextEditingController();
  final TextEditingController _ifsCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false; // Add this variable

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Required Documents',style: inter1.copyWith(fontWeight: FontWeight.w700,fontSize:17.sp ),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ksize10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          for (int i = 0; i <= index; i++) {
                            _dotsSelected[i] = true;
                          }
                          for (int i = index + 1; i < 5; i++) {
                            _dotsSelected[i] = false;
                          }
                          _currentPage = index;
                          _pageController.jumpToPage(index);
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            height: 20.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _dotsSelected[index]
                                  ? AppColors.primaryColor
                                  : (index == _currentPage
                                  ? AppColors.primaryColor
                                  : Colors.grey),
                            ),
                            child: Center(
                              child: _dotsSelected[index] || index == _currentPage
                                  ? (index == _currentPage
                                  ? Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                                  : Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14.sp,
                              ))
                                  : Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          if (index < 4)
                            Container(
                              width: 20.w,
                              child: const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
                ksize15,
                Text(
                  'Update Account Details',
                  style: inter1.copyWith(
                      fontSize: 17.sp, fontWeight: FontWeight.w700),
                ),
                ksize10,
                Text('Bank Name *', style: interMedi),
                ksize5,
                CustomTextFormField(
                  controller: _banknameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Bank name';
                    }
                    return null;
                  },
                ),
                ksize10,
                Text('Bank Account Number *', style: interMedi),
                ksize5,
                CustomTextFormField(
                  controller: _accontNumberController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Bank Number';
                    }
                    return null;
                  },
                ),
                ksize10,
                Text('IFSC Code *', style: interMedi),
                ksize5,
                CustomTextFormField(
                  controller: _ifsCodeController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter IFSC Code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height / 70),
                GestureDetector(
                  onTap: () => _showBottomSheet(context),
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 80.h,
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
                                height: 20.h,
                                width: 40.w,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Upload Proof',
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
                SizedBox(height: size.height / 70),
                _selectedImage != null
                    ? Stack(
                        children: [
                          SizedBox(
                            width: 90.w, // Adjust the width as needed
                            height: 90.h, // Adjust the height as needed
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
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
                                  _selectedImage =
                                      null; // Clear the selected image
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),

              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: SizedBox(
                height: 45.h,
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _uploadBankDetails();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    side: BorderSide(color: AppColors.primaryColor, width: 1.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Next',
                    // _currentPage < 4
                    //     ? 'Next'
                    //     : 'Submit', // Change text to 'Submit' when on the last page
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
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
              // ListTile(
              //   leading: const Icon(Icons.camera_alt),
              //   title: const Text('Camera'),
              //   onTap: () {
              //     Navigator.pop(context);
              //     _pickImage(ImageSource.camera);
              //   },
              // ),
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

  Future<void> _uploadBankDetails() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );

    try {
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      print('token success');
      if (authtoken == null) {
        throw Exception('Token not found');
      }

      // API endpoint
      const String url =
          'https://veelgo.digitaldatatechnologia.in/api/update_bank';

      // Headers
      var headers = {
        'Authorization': 'Bearer $authtoken',
        'Content-Type': 'application/json',
      };

      // Prepare the image file
      var imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
      imageUploadRequest.headers.addAll(headers);
      imageUploadRequest.files.add(
        await http.MultipartFile.fromPath(
          'bank_proof', // API field name for the image
          _selectedImage!.path,
        ),
      );

      // Other form data
      imageUploadRequest.fields['bank_name'] = _banknameController.text;
      imageUploadRequest.fields['account_number'] =
          _accontNumberController.text;
      imageUploadRequest.fields['ifs_code'] = _ifsCodeController.text;

      // Send the request
      var streamedResponse = await imageUploadRequest.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        Get.back();
        var responseData = jsonDecode(response.body);
        // Handle success response as needed
        print('Bank details updated successfully: $responseData');
        SnackbarUtils.showSnackbar(context, 'Bank details updated Succesfully');
        Get.to(EmergencyDetails());
      } else {
        Get.back();
        print('Failed to update bank details: ${response.statusCode}');
        SnackbarUtils.showSnackbar(context, 'Failed to update bank details');

        // Handle error response
      }
    } catch (e) {
      Get.back();
      print('Error updating bank details: $e');
      SnackbarUtils.showSnackbar(context, e.toString());
      // Handle exception
    }
  }
}

class EmergencyDetails extends StatefulWidget {
  const EmergencyDetails({super.key});

  @override
  State<EmergencyDetails> createState() => _EmergencyDetailsState();
}

class _EmergencyDetailsState extends State<EmergencyDetails> {
  final PageController _pageController = PageController();
  int _currentPage = 4;
  List<bool> _dotsSelected = [true, true, true, true, true ];
  File? _image;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  final LoginApi _loginApi = LoginApi();
  int selectedIndex = 0;
  String selectedValues = "+65";
  final formkey = GlobalKey<FormState>();

  TextEditingController emergencyConatctName = TextEditingController();
  TextEditingController emergencyContactNumber = TextEditingController();
  TextEditingController relationshipContact = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Required Documents',style: inter1.copyWith(fontWeight: FontWeight.w700,fontSize:17.sp ),),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ksize10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          for (int i = 0; i <= index; i++) {
                            _dotsSelected[i] = true;
                          }
                          for (int i = index + 1; i < 5; i++) {
                            _dotsSelected[i] = false;
                          }
                          _currentPage = index;
                          _pageController.jumpToPage(index);
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            height: 20.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _dotsSelected[index]
                                  ? AppColors.primaryColor
                                  : (index == _currentPage
                                  ? AppColors.primaryColor
                                  : Colors.grey),
                            ),
                            child: Center(
                              child: _dotsSelected[index] || index == _currentPage
                                  ? (index == _currentPage
                                  ? Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                                  : Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14.sp,
                              ))
                                  : Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          if (index < 4)
                            Container(
                              width: 20.w,
                              child: const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
                ksize15,
                Text(
                  'Update Emergency Details',
                  style: inter1.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: Colors.black),
                ),
                ksize10,
                Text(
                  'Emergency Contact Name *',
                  style: inter1.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: AppColors.bluegrey),
                ),
                ksize10,
                CustomTextFormField(
                  controller: emergencyConatctName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter emergency contact name';
                    }
                    return null;
                  },
                ),
                ksize10,
                Text(
                  'Emergency Contact Number *',
                  style: inter1.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: AppColors.bluegrey),
                ),
                ksize10,
                TextFormAddedNumbr(
                  controller: emergencyContactNumber,
                  keyboardType: TextInputType.number,
                  leadingIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PopupMenuButton<int>(
                          child: Container(
                            height: 30,
                            child: Center(
                              child: Text(
                                selectedValues,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          onSelected: (value) {
                            setState(() {
                              selectedIndex = value;
                              selectedValues = value == 0 ? "+65" : "+91";
                              // Update input formatters based on selected country code
                              emergencyContactNumber.text = '';
                            });
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Container(
                                height: 30,
                                child: Text(
                                  "+65",
                                  style: poppins2,
                                ),
                              ),
                            ),
                            PopupMenuItem<int>(
                              value: 1,
                              child: Container(
                                height: 30,
                                child: Text(
                                  "+91",
                                  style: poppins2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(
                        selectedValues == "+65" ? 8 : 10),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your 6-digit code';
                    }
                    return null;
                  },
                ),
                ksize10,
                Text(
                  'Contact Relationship *',
                  style: inter1.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: AppColors.bluegrey),
                ),
                ksize10,
                CustomTextFormField(
                  controller: relationshipContact,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter emergency contact name';
                    }
                    return null;
                  },
                ),
                ksize10,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: SizedBox(
              height: 45.h,
              width: size.width,
              child: ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    _updateEmergencyDetails(
                      emergencyConatctName.text,
                      selectedValues + emergencyContactNumber.text,
                      relationshipContact.text,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor,
                  side: BorderSide(color: AppColors.primaryColor, width: 1.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Next',
                  // _currentPage < 4
                  //     ? 'Next'
                  //     : 'Submit', // Change text to 'Submit' when on the last page
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateEmergencyDetails(String emergencyContactName,
      String emergencyContactNumber, String relationship) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
    try {

      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("auth_token");
      // String? token = await _loginApi.getToken();
      if (authtoken == null) {
        throw Exception('Token not found');
      }


      const String url =
          'https://veelgo.digitaldatatechnologia.in/api/update_emergeny';
      var headers = {
        'Authorization': 'Bearer $authtoken',
        'Content-Type': 'application/json',
      };

      var body = jsonEncode({
        "emergency_contact_name": emergencyContactName,
        "emergency_contact_number": emergencyContactNumber,
        "relationship": relationship,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // Handle success response as needed
        print('Emergency contact details updated successfully: $responseData');
        SnackbarUtils.showSnackbar(
            context, 'Upload Emergency details Succesfully');
        Get.to(SuccessDoc());
      } else {
        print(
            'Failed to update emergency contact details: ${response.statusCode}');
        SnackbarUtils.showSnackbar(context, 'Details Failed');
        // Handle error response
      }
    } catch (e) {
      print('Error updating emergency contact details: $e');
      SnackbarUtils.showSnackbar(context, 'Error');
      // Handle exception
    }
  }
}
