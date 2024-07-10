import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:veelgo/commonClasses.dart';
import 'package:veelgo/login_reg_screens/register.dart';
import 'package:veelgo/login_reg_screens/successDoc.dart';
import 'package:veelgo/properties/common%20properties.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class FleetDocuments extends StatefulWidget {
  const FleetDocuments({super.key});

  @override
  State<FleetDocuments> createState() => _FleetDocumentsState();
}

class _FleetDocumentsState extends State<FleetDocuments> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<bool> _dotsSelected = [false, false, false,];
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

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;


    return WillPopScope(
        onWillPop: () async{
      Get.offAll(const Register());

      return false;
    },
      child: Scaffold(

        appBar: AppBar(
          title:  Text(
            'Required Document',
            style: inter1.copyWith(fontSize: 17.sp,fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: _currentPage > 0
              ? IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {
                _dotsSelected[_currentPage] = false;
                _currentPage > 0;
              });
            },
          )
              : null,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      for (int i = 0; i <= index; i++) {
                        _dotsSelected[i] = true;
                      }
                      for (int i = index + 1; i < 3; i++) {
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
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: sWidth / 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _dotsSelected[index]
                              ? AppColors.primaryColor
                              : (index == _currentPage
                              ? Colors.blue
                              : Colors.grey),
                        ),
                        child: Center(
                          child: _dotsSelected[index] || index == _currentPage
                              ? (index == _currentPage
                              ? Text(
                            (index + 1).toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                              : const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ))
                              : Text(
                            (index + 1).toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if (index < 2)
                        const SizedBox(
                          width: 100,
                          child: Divider(
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
            Expanded(
              child: PageView(
                controller: _pageController,
                children: const [
                  UpdateLogo(),
                  UpdateACRA(),
                  UpdateProof(),

                ],
              ),
            ),


          ],
        ),
        bottomNavigationBar:  Container(
          height: 60.h,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton (
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  setState(() {
                    _dotsSelected[_currentPage] = true;
                    _currentPage++;
                  });
                } else {
                  // Perform submit action here
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>   SuccessDoc(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                side: const BorderSide(color: AppColors.primaryColor, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                _currentPage < 2 ? 'Next' : 'Submit', // Change text to 'Submit' when on the last page
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: sHeight / 55,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}


class UpdateLogo extends StatefulWidget {
  const UpdateLogo({Key? key}) : super(key: key);

  @override
  State<UpdateLogo> createState() => _UpdateLogoState();
}

class _UpdateLogoState extends State<UpdateLogo> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sWidth / 25),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Update Profile Picture',
                  style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700),),
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
                      'Please Upload a Clear Selfie',
                        style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w700),
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
                        alignment: Alignment.center,
                        child: Text(
                          'The Selfie Should have the applicants face alone',
                          style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w700),
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
                      style: inter1.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w700),
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
            padding: EdgeInsets.symmetric(horizontal: sWidth / 30),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lytBlue,
                  borderRadius: BorderRadius.circular(5),
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
                          height: 25.h,
                          width: 25.w,
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Upload company logo',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
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
        _selectedImage != null
            ? Stack(
            children: [
              Container(
                width: 90.h, // Adjust the width as needed
                height: 90.w, // Adjust the height as needed
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
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
                  icon: const Icon(Icons.cancel_rounded,color: Colors.red,),
                  onPressed: () {
                    setState(() {
                      _selectedImage = null; // Clear the selected image
                    });
                  },
                ),
              ),
            ]
        )
            : const SizedBox.shrink()
      ],
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



class UpdateACRA extends StatefulWidget {
  const UpdateACRA({super.key});

  @override
  State<UpdateACRA> createState() => _UpdateACRAState();
}

class _UpdateACRAState extends State<UpdateACRA> {
  File? _selectedImage;



  @override
  Widget build(BuildContext context) {
    TextEditingController UenNumberController = TextEditingController();
    TextEditingController AddressController = TextEditingController();;
    TextEditingController UnityNumberController = TextEditingController();
    TextEditingController BlockNumberController = TextEditingController();
    TextEditingController CityController = TextEditingController();
    TextEditingController PostalController = TextEditingController();

    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sWidth / 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text('Upload Required Details',
                    style:inter1.copyWith(fontWeight: FontWeight.w700,fontSize: 17.sp)),
                SizedBox(height: sHeight/90),
                TextFormField(
                  controller: UenNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    filled: true, // Fill the background color
                    fillColor: Colors.grey[100], // Set the background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    hintText: 'UEN Number *',
                    hintStyle: MyFonts.interPop,
                    focusedBorder: OutlineInputBorder(
                      // Customize focused border
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor, // Set indicator color
                        width: 0.3, // Set indicator width
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 17.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: sHeight * 0.02),
                TextFormField(
                  controller: AddressController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    filled: true, // Fill the background color
                    fillColor: Colors.grey[100], // Set the background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    hintText: 'Enter Address *',
                    hintStyle: MyFonts.interPop,
                    focusedBorder: OutlineInputBorder(
                      // Customize focused border
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor, // Set indicator color
                        width: 0.3, // Set indicator width
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 17.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: sHeight * 0.02),
                TextFormField(
                  controller: BlockNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    filled: true, // Fill the background color
                    fillColor: Colors.grey[100], // Set the background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    hintText: 'Block Number *',
                    hintStyle: MyFonts.interPop,
                    focusedBorder: OutlineInputBorder(
                      // Customize focused border
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor, // Set indicator color
                        width: 0.3, // Set indicator width
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 17.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: sHeight * 0.02),
                TextFormField(
                  controller: UnityNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    filled: true, // Fill the background color
                    fillColor: Colors.grey[100], // Set the background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    hintText: 'Unit No *',
                    hintStyle: MyFonts.interPop,
                    focusedBorder: OutlineInputBorder(
                      // Customize focused border
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor, // Set indicator color
                        width: 0.3, // Set indicator width
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 17.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: sHeight * 0.02),
                TextFormField(
                  controller: CityController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    filled: true, // Fill the background color
                    fillColor: Colors.grey[100], // Set the background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    hintText: 'City *',
                    hintStyle: MyFonts.interPop,
                    focusedBorder: OutlineInputBorder(
                      // Customize focused border
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor, // Set indicator color
                        width: 0.3, // Set indicator width
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 17.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: sHeight * 0.02),
                TextFormField(
                  controller: PostalController  ,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    filled: true, // Fill the background color
                    fillColor: Colors.grey[100], // Set the background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    hintText: 'Postal Code *',
                    hintStyle: MyFonts.interPop,
                    focusedBorder: OutlineInputBorder(
                      // Customize focused border
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor, // Set indicator color
                        width: 0.3, // Set indicator width
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 17.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                 ksize10,
                 Text('Update ACRA',style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700),),
                SizedBox(height: sHeight * 0.01),
                GestureDetector(
                  onTap: () => _showBottomSheet(context),
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
                        color: AppColors.primaryColor,
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
                                'Upload Upload ACRA PDF',
                                style: inter1.copyWith(
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
                SizedBox(height: sHeight / 100),
                _selectedImage != null
                    ? Stack(
                    children: [
                      Container(
                        width: 90, // Adjust the width as needed
                        height: 90, // Adjust the height as needed
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
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
                          icon: const Icon(Icons.cancel_rounded,color: Colors.red,),
                          onPressed: () {
                            setState(() {
                              _selectedImage = null; // Clear the selected image
                            });
                          },
                        ),
                      ),
                    ]
                )
                    : const SizedBox.shrink()
      
              ],
            ),
          ),
      
      
        ],
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


class UpdateProof extends StatefulWidget {
  const UpdateProof({super.key});

  @override
  State<UpdateProof> createState() => _UpdateProofState();
}

class _UpdateProofState extends State<UpdateProof> {
  File? _selectedImage;
  final TextEditingController _banknameController = TextEditingController();
  final TextEditingController _accontNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    final sHeight = size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text('Update Account Details',style: inter1.copyWith(fontSize: 17.sp,fontWeight: FontWeight.w700),),
            ksize10,
             Text(
              'Bank Name *',
                 style: inter1.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w700,color: AppColors.bluegrey),
            ),
            ksize5,
            CustomTextFormField(controller: _banknameController),
            ksize10,
             Text(
              'Bank Account Number *',
               style: inter1.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w700,color: AppColors.bluegrey),
            ),
            ksize5,
            CustomTextFormField(controller: _banknameController),
            ksize10,
             Text('Upload Proof',style: inter1.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w700,color: AppColors.bluegrey),),
            SizedBox(height: sHeight/70),
            GestureDetector(
              onTap: () => _showBottomSheet(context),
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
                            height: sHeight / 30,
                            width: sWidth / 30,
                          ),
                          const SizedBox(height: 2),
                           Text(
                            'Upload Proof',
                            style: inter1.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ksize10,
            _selectedImage != null
                ? Stack(
                children: [
                  SizedBox(
                    width: 90.w, // Adjust the width as needed
                    height: 90.h, // Adjust the height as needed
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
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
                      icon: const Icon(Icons.cancel_rounded,color: Colors.red,),
                      onPressed: () {
                        setState(() {
                          _selectedImage = null; // Clear the selected image
                        });
                      },
                    ),
                  ),
        
                ]
        
            )
                : SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Traning',style: MyFonts.interCom,),

                Container(
                  height: sHeight / 25,
                  width: sWidth / 5,
                  decoration: BoxDecoration(
                    color: AppColors.lytBlue,
                    borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                  ),
                  child: const Center(
                    child: Text(
                      'Open',
                      style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primaryColor,fontSize: 17)
                    ),
                  ),
                )

              ],

            )
        
          ],
        
        
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


