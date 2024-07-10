import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountInvoice extends StatefulWidget {
  const AccountInvoice({super.key});

  @override
  State<AccountInvoice> createState() => _AccountInvoiceState();
}

class _AccountInvoiceState extends State<AccountInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AccountInvoice'),
      ),
      body: Center(
        child: Text(
          'AccountInvoice',
          style: TextStyle(fontSize: 24.sp),
        ),
      ),
    );
  }
}