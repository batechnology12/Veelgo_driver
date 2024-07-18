import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:veelgo/controller/booking_controller.dart';
import 'package:veelgo/properties/common%20properties.dart';
import 'package:veelgo/service/booking_api_service.dart';

class ConfirmDelivery extends StatefulWidget {
  String dropadress;
  String bookingid;
  String bookid;
   String pickaddress;
  String deververyaddress;
  ConfirmDelivery(
      {super.key,
      required this.dropadress,
      required this.bookingid,
       required this.deververyaddress,
      required this.pickaddress,
      required this.bookid});

  @override
  State<ConfirmDelivery> createState() => _ConfirmDeliveryState();
}

class _ConfirmDeliveryState extends State<ConfirmDelivery> {
  File? _selectedImage;
  BookingController bookingApicontoller = BookingController();
  List<File>? _selectedLicenseImages = [];
  List<File>? _selectedVehicleImages = [];
  List<File>? allImages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 19,
            )),
        title: Text(
          'Delivery Proof',
          style: inter1.copyWith(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 140.h,
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on,
                                      color: Colors.red),
                                  wsize5,
                                  wsize5,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Pickup Details',
                                            style: poppinsBg,
                                          ),
                                          ksize5,
                                          Container(
                                            width: 180.w,
                                            child: Text(
                                              widget.dropadress,
                                              style: addInter,
                                            ),
                                          ),
                                          ksize10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    size: 12.sp,
                                                  ),
                                                  wsize2,
                                                  Text(
                                                    'Call',
                                                    style: poppins1.copyWith(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                              wsize5,
                                              wsize5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed('/chatScreen');
                                                },
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                        height: 13.sp,
                                                        child: SvgPicture.asset(
                                                          'assets/wtsap.svg',
                                                        )),
                                                    wsize2,
                                                    Text(
                                                      'WatsApppp',
                                                      style: poppins1.copyWith(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              wsize5,
                                              wsize2,
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 1, right: 5),
                                    child: Text(
                                      '3pm to 4pm',
                                      style: MyFonts.interBG,
                                    ),
                                  ),
                                  ksize10,
                                  SizedBox(
                                      height: 12.h,
                                      child:
                                          SvgPicture.asset('assets/arrow.svg')),
                                ],
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
                ksize10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    'Customer Signature',
                    style: poppins1.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.blueGrey),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/customerSign');
                  },
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: Card(
                        color: Colors.white,
                        elevation: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.yellow.shade100,
                                  child: SizedBox(
                                      height: 18.h,
                                      child: SvgPicture.asset(
                                          'assets/pencil.svg')),
                                ),
                                wsize10,
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Text(
                                    'Customer Signature',
                                    style: poppins1.copyWith(
                                        fontWeight: FontWeight.w900),
                                  ),
                                )
                              ],
                            ),
                            wsize10,
                            wsize10,
                            Row(
                              children: [
                                SizedBox(
                                    height: 15.h,
                                    child: SvgPicture.asset(
                                        'assets/tikverify.svg')),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ),
                ksize10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    'OTP Verification',
                    style: poppins1.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.blueGrey),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _otpBottomSheet(context);
                  },
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: Card(
                        color: Colors.white,
                        elevation: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Colors.teal.shade100,
                                  child: SizedBox(
                                      height: 18.h,
                                      child: SvgPicture.asset(
                                          'assets/otpverify.svg')),
                                ),
                                wsize10,
                                Text(
                                  'OTP Verification',
                                  style: poppins1.copyWith(
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                            wsize10,
                            wsize10,
                            Row(
                              children: [
                                SizedBox(
                                    height: 15.h,
                                    child: SvgPicture.asset(
                                        'assets/tikverify.svg')),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ),
                ksize10,
                ksize10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    'Front & Back Side Package Picture',
                    style: poppins1.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.blueGrey),
                  ),
                ),
                ksize10,
                GestureDetector(
                  onTap: () => _uploadPicturesheet(context, true),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Center(
                      child: Container(
                        height: 80.h,
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
                                SizedBox(height: 2.w),
                                Text(
                                  'Upload Package image',
                                  textAlign: TextAlign.center,
                                  style: poppinsBg,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildImageGrid(),
                ksize10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    'Remarks',
                    style: poppins1.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.blueGrey),
                  ),
                ),
                ksize10,
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 0.1), // Border color when enabled
                      // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 0.2), // Border color when focused
                      // Rounded corners
                    ),
                    hintText: 'Enter your text here',
                  ),
                ),
                ksize20,
                Center(
                  child: Obx(() {
                    return bookingApicontoller.conformloading.isTrue
                        ? CircularProgressIndicator()
                        : SizedBox(
                            height: 46.h,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                bookingApicontoller.Conformdelivery(
                                    bookingid: widget.bookingid,
                                    bookid: widget.bookid,
                                    otp: "0000",
                                    pacakgeimage: allImages!,
                                    context: context, pickaddress: '', dropaddress: '');
                                // _successPop(context);
                                // print('tony');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors
                                    .primaryColor, // Change button color

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                'Confirm Delivery',
                                style: inter1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    letterSpacing: 1),
                              ),
                            ),
                          );
                  }),
                ),
                ksize10,
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          deliveryHelp(context);
                        },
                        child: const Text(
                          'Help',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
                ksize10,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _uploadPicturesheet(BuildContext context, bool isLicense) {
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
                  final List<XFile>? pickedFiles =
                      await ImagePicker().pickMultiImage();
                  if (pickedFiles != null && pickedFiles.isNotEmpty) {
                    List<File> files = pickedFiles
                        .map((pickedFile) => File(pickedFile.path))
                        .toList();
                    _addImages(files, isLicense);
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () async {
                  final pickedFile =
                      await ImagePicker().pickImage(source: ImageSource.camera);
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

  void _addImages(List<File> images, bool isLicense) {
    setState(() {
      if (isLicense) {
        _selectedLicenseImages!.addAll(images);
      } else {
        _selectedVehicleImages!.addAll(images);
      }
    });
  }

  Widget _buildImageGrid() {
    allImages = [...?_selectedLicenseImages, ...?_selectedVehicleImages];
    return allImages!.isNotEmpty
        ? Wrap(
            children: allImages!
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
                          top: -16,
                          right: -16,
                          child: IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 18,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_selectedLicenseImages!.contains(file)) {
                                  _selectedLicenseImages!.remove(file);
                                } else if (_selectedVehicleImages!
                                    .contains(file)) {
                                  _selectedVehicleImages!.remove(file);
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ))
                .toList(),
          )
        : const SizedBox.shrink();
  }

  deliveryHelp(BuildContext context) {
    bool damage = false;
    bool alternative = false;
    bool notListed = false;
    bool others = false;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.9, // Set the desired width here
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Undeliverd ',
                        style: inter1.copyWith(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            size: 20.sp,
                            color: Colors.red,
                          ))
                    ],
                  ),
                  ksize10,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                damage = !damage;
                              });
                            },
                            child: Container(
                              height: 23.h,
                              width: 23.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.bluegrey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: damage
                                  ? SvgPicture.asset("assets/boxtik.svg")
                                  : const Text(""),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("Damage",
                              style: inter1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      ),
                      ksize10,
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                alternative = !alternative;
                              });
                            },
                            child: Container(
                              height: 25.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.bluegrey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: alternative
                                  ? SvgPicture.asset("assets/boxtik.svg")
                                  : Text(""),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("Found a better alternative",
                              style: inter1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      ),
                      ksize10,
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                notListed = !notListed;
                              });
                            },
                            child: Container(
                              height: 23.h,
                              width: 23.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.bluegrey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: notListed
                                  ? SvgPicture.asset("assets/boxtik.svg")
                                  : const Text(""),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("Cancel Order",
                              style: inter1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      ),
                      ksize10,
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                others = !others;
                              });
                            },
                            child: Container(
                              height: 25.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.bluegrey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: others
                                  ? SvgPicture.asset("assets/boxtik.svg")
                                  : Text(""),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("Others",
                              style: inter1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      ),
                      ksize10,
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'Submit',
                        style: inter1.copyWith(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void _successPop(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent dismissing by tapping outside
      builder: (BuildContext context) {
        // Return the dialog
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/successtik.svg'),
                SizedBox(height: 10),
                Text(
                  'Your message sent to admin.\nAdmin will contact you.',
                  textAlign: TextAlign.center,
                  style: poppinsBg,
                ),
              ],
            ),
          ),
        );
      },
    );

    // Delay navigation using Future.delayed
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Dismiss the dialog
      Navigator.pushNamed(context, '/payment'); // Navigate to payment page
    });
  }

  void _otpBottomSheet(BuildContext context) {
    // List to store OTP digits
    var mobileController = TextEditingController();
    // late StreamController<ErrorAnimationType> errorController;
    TextEditingController otpController = TextEditingController();

    String currentText = "";
    bool hasError = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Ensures bottom sheet covers the entire screen when keyboard is shown
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, // Padding to avoid keyboard covering content
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'OTP Verify',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please enter the 4-digit OTP code sent to your number.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: inter1.copyWith(
                        color: AppColors.white,
                        // color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: false,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (v) {
                        if (v!.length < 4) {
                          hasError = true;

                          return "";
                        } else {
                          hasError = false;

                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        selectedFillColor: Colors.grey.shade100,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: Colors.grey.shade100,
                        selectedColor: Colors.grey.shade100,
                        inactiveFillColor: Colors.grey.shade200,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(9),
                        fieldHeight: 60,
                        fieldWidth: 60,
                        activeFillColor:
                            hasError ? Color(0xffF8F8F8) : Color(0xffF8F8F8),
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      textStyle: inter1.copyWith(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      enableActiveFill: true,
                      //    errorAnimationController: errorController,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                          hasError = false;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        height: 46.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print('pressed button');
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                AppColors.primaryColor, // Change button color

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: inter1.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
