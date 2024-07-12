import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:veelgo/properties/common%20properties.dart';

import '../driverTabs/All.dart';
import '../driverTabs/filter.dart';
import '../driverTabs/parcel.dart';
import '../driverTabs/vehicle.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  bool status = false;

  final List<String> _headers = ['All', 'Parcel', 'Vehicle'];

  // List of screen widgets corresponding to each header
  final List<Widget> _screenWidgets = [
    AllScreen(),
    Parcel(),
    Vehicle(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h), // Set your preferred height here
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            color: AppColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$56.00',
                        style: inter1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.sp,
                          color: Colors.white,
                        ),
                      ),
                       Text(
                        'Your overall amount earning',
                        style: poppins1.copyWith(color: Colors.white,fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70, right: 20),
                  child: FlutterSwitch(
                    width: 55.w,
                    height: 25.h,
                    valueFontSize: 6.sp,
                    toggleSize: 25.sp,
                    value: status,
                    activeToggleColor: Colors.green,
                    inactiveToggleColor: Colors.red,
                    activeText: 'Online',
                    activeTextFontWeight: FontWeight.w900,
                    inactiveTextColor: Colors.black,
                    activeTextColor: Colors.black,
                    inactiveText: 'Offline',
                    inactiveColor: Colors.white,
                    activeColor: Colors.grey.shade100,
                    toggleColor: Colors.green,
                    borderRadius: 18.0,
                    padding: 2.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Horizontal list of headers
          Container(
            color: AppColors.lytBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 260.w,
                  height: 55.h,
                  color: AppColors.lytBlue,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _headers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25), // Adjust the value according to your preference
                          child: Container(
                           padding: const EdgeInsets.only(right: 10),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.transparent, // Change this color to make the red border disappear
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Container(
                              height: 35.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: index == _selectedIndex ? AppColors.primaryColor : Colors.white,
                                borderRadius: BorderRadius.circular(20), // Adjust the value according to your preference
                              ),
                              child: Center(
                                child: Text(
                                  _headers[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: index == _selectedIndex ? Colors.white : Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Wrap(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,  // Add this line
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ksize10,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 150),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey,
                                        ),
                                        height: 4.h,
                                      ),
                                    ),
                                    ksize20,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Filter & Sort',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Clear',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.sp,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ksize10,
                                    const Text(
                                      'Distance Range',
                                      style: MyFonts.interbig, // Use your custom font style here
                                    ),
                                    ksize10,
                                    Stack(
                                      children: [
                                        const Positioned(
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 5, left: 25, right: 25),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('0km', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Colors.blueGrey)),
                                                Text('50km', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Colors.blueGrey)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: SliderTheme(
                                                data: SliderTheme.of(context).copyWith(
                                                  activeTrackColor: AppColors.primaryColor, // Change active track color
                                                  inactiveTrackColor: Colors.grey,
                                                  trackHeight: 2.0,
                                                  thumbColor: AppColors.primaryColor, // Change thumb color
                                                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                                                  overlayColor: Colors.blue.withAlpha(25),
                                                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                                                  tickMarkShape: RoundSliderTickMarkShape(),
                                                  activeTickMarkColor: AppColors.primaryColor,
                                                  inactiveTickMarkColor: Colors.grey,
                                                ),
                                                child: Slider(
                                                  min: 0.0,
                                                  max: 1.0,
                                                  value: 0.5, // Example value, replace with your logic
                                                  onChanged: (double value) {
                                                    // Handle slider value change
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    ksize10,
                                    const Text(
                                      'By Amount',
                                      style: MyFonts.interbig, // Use your custom font style here
                                    ),
                                    ksize10,
                                    Stack(
                                      children: [
                                        Positioned(
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 5.h, left: 25, right: 25),
                                            child: const Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('0km', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Colors.blueGrey)),
                                                Text('50km', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Colors.blueGrey)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: SliderTheme(
                                                data: SliderTheme.of(context).copyWith(
                                                  activeTrackColor: AppColors.primaryColor, // Change active track color
                                                  inactiveTrackColor: Colors.grey,
                                                  trackHeight: 2.0,
                                                  thumbColor: AppColors.primaryColor,  // Change thumb color
                                                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                                                  overlayColor: Colors.blue.withAlpha(25),
                                                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                                                  tickMarkShape: RoundSliderTickMarkShape(),
                                                  activeTickMarkColor: AppColors.primaryColor,
                                                  inactiveTickMarkColor: Colors.grey,
                                                ),
                                                child: Slider(
                                                  min: 0.0,
                                                  max: 1.0,
                                                  value: 0.5, // Example value, replace with your logic
                                                  onChanged: (double value) {
                                                    // Handle slider value change
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    ksize10,
                                    const Text(
                                      'By Delivery Type',
                                      style: MyFonts.interbig, // Use your custom font style here
                                    ),
                                    ksize5,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildDeliveryOptionChip('Specific Time'),
                                        _buildDeliveryOptionChip('3 hours'),
                                        _buildDeliveryOptionChip('Express'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildDeliveryOptionChip('Same day delivery'),
                                        _buildDeliveryOptionChip('Next day delivery'),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Center(
                                      child: SizedBox(
                                        height: 50.h,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Add your onPressed code here!
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: AppColors.primaryColor, // Change button color
                                            side: BorderSide(
                                              color: Colors.white,
                                              width: 2.w,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                          child: Text(
                                            'Apply',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ksize15,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.sp,
                    child: const Icon(Icons.filter_alt, color: AppColors.bluegrey),
                  ),
                )
              ],
            ),
          ),

          // Display the dynamically selected screen widget
          Flexible(
            child: Container(
              height: 600.h,
              color: AppColors.white,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700), // Adjust the duration as needed
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: _screenWidgets[_selectedIndex],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDeliveryOptionChip(String text) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
      backgroundColor: Colors.white,
      shape: StadiumBorder(
        side: BorderSide(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }
}
