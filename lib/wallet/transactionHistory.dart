import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veelgo/wallet/withdraw/withDraw.dart';
import 'package:intl/intl.dart';
import '../network/controllers/auth_api_controllers.dart';
import '../properties/common properties.dart';

import 'all/AllTransaction.dart';
import 'earnings/Earnings.dart';



class TransactionHistoryPage extends StatefulWidget {
  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {


  final AuthControllers transactionhistory = Get.put(AuthControllers());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Define the number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){
               Get.back();
              },
              child:  Icon(Icons.arrow_back_ios_new_outlined,size: 18.sp,)),
          centerTitle: true,
          title: Text(
            'Transaction History',
            style: inter1.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          bottom: TabBar(
            labelStyle: inter1.copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.primaryColor,

            tabs: const [
              Tab(text: 'All',), // Define each tab with a label
              Tab(text: 'Earnings'),
              Tab(text: 'WithDraw'),
            ],
            onTap: (index){
              if (index == 0) {
                transactionhistory.fetchTransactions("All");
              } else if (index == 1) {
                transactionhistory.fetchTransactions("credit");
              } else if (index == 2) {
                transactionhistory.fetchTransactions("debit");
              }
            },
          ),
        ),
        body:  TabBarView(
          children: [
            AllTransaction(),
            Earnings(),
            WithDraw(),
            // Content for Tab 1

          ],
        ),
      ),
    );
  }
}
