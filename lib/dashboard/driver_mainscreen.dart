  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:flutter_svg/flutter_svg.dart';
  import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
  import 'package:veelgo/properties/common%20properties.dart';

  import 'bottomFeatures/account.dart';
  import 'bottomFeatures/home.dart';
  import 'bottomFeatures/myOrder.dart';
  import 'bottomFeatures/notofications.dart';
  import 'bottomFeatures/wallet.dart';

  class MainDashboardScreen extends StatefulWidget {
    const MainDashboardScreen({Key? key});

    @override
    State<MainDashboardScreen> createState() => _MainDashboardScreenState();
  }

  class _MainDashboardScreenState extends State<MainDashboardScreen> {
    int _selectedIndex = 2;
    // Initially selected index is 3 (zero-based index).

    bool status = false;

    final List<Widget> _pages = [
      const MyOrder(),
      WalletPage(),
      HomeScreen(),
      NotificationPage(),
      AccountPage(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
      final sWidth = size.width;
      final sHeight = size.height;
      return WillPopScope(
        onWillPop: ()async {
          SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
          body: Center(child: _pages[_selectedIndex],),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/order.svg',color: _selectedIndex == 0 ? AppColors.primaryColor : Colors.black54,),
                label: 'My order',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/wallet.svg',color: _selectedIndex == 1 ?AppColors.primaryColor : Colors.black54,),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/home.svg',color: _selectedIndex == 2 ? AppColors.primaryColor : Colors.black54,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                    height: 23.h,
                    child: SvgPicture.asset('assets/noti.svg',  color: _selectedIndex == 3 ? AppColors.primaryColor : Colors.black54,)),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/profile.svg',  color: _selectedIndex == 4 ? AppColors.primaryColor : Colors.black54,),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedFontSize: 12,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold, // Make selected label bold
            ), // Adjust the font size here
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500, // Make selected label bold
            ), // Adjust the font size here
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
              ),
      );

    }
  }


