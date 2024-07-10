import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veelgo/dashboard/driver_mainscreen.dart';
import 'package:veelgo/login_reg_screens/login.dart';
import 'package:veelgo/properties/common%20properties.dart';

class SuccessDoc extends StatefulWidget {
  @override
  _SuccessDocState createState() => _SuccessDocState();
}

class _SuccessDocState extends State<SuccessDoc> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Start the loading
    _startLoading();

  }

  void _startLoading() {
    // Simulate loading for 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      // After 5 seconds, stop loading and update the UI
      setState(() {
        _isLoading = false;
        SnackbarUtils.showSnackbar(context, 'Registered Successfully');
       Get.to(const MainDashboardScreen());
        });
    }
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _isLoading
                ? const SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  )
                : const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 80,
                  ),
          ),

          SizedBox(height: 20),
          const Text(
            'Your details has been send to admin succesfully',
            style: MyFonts.interCom,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
