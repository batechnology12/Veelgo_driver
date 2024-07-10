import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewRate extends StatefulWidget {
  const ReviewRate({super.key});

  @override
  State<ReviewRate> createState() => _ReviewRateState();
}

class _ReviewRateState extends State<ReviewRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReviewRate'),
      ),
      body: Center(
        child: Text(
          'ReviewRate',
          style: TextStyle(fontSize: 24.sp),
        ),
      ),
    );
  }
}