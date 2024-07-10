import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountLogout extends StatefulWidget {
  const AccountLogout({super.key});

  @override
  State<AccountLogout> createState() => _AccountLogoutState();
}

class _AccountLogoutState extends State<AccountLogout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AccountLogout'),
      ),
      body: Center(
        child: Text(
          'AccountLogout',
          style: TextStyle(fontSize: 24.sp),
        ),
      ),
    );
  }
}