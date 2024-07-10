import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../properties/common properties.dart';

class BankDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bank Details',style: poppins1.copyWith(fontWeight: FontWeight.bold,fontSize: 18)),
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
            child: const Icon(Icons.arrow_back_ios_new_outlined,size: 17,)),
      ),
      body: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Container(
                 height: 100.h,

                 decoration:  BoxDecoration(
                     color: AppColors.lytYellow,
                         border: Border.all(width: 1,color: Colors.orange),
                   borderRadius: BorderRadius.circular(10)
                 ),
                 child:  Center(
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SvgPicture.asset('assets/hand.svg'),
                       wsize5,
                       Container(
                         height: 50.h,transformAlignment: Alignment.center,
                           child: Text('if you want to update these details\nplease contact partner support enter',style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.red.shade500,),),),


                     ],
                   ),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.grey.shade100,
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           SvgPicture.asset('assets/bank.svg'),
                           wsize10,
                           Text('Bank Details',style: inter1.copyWith(fontWeight: FontWeight.bold,fontSize:20,))

                         ],
                       ),
                       Divider(thickness: 1,endIndent: 10,indent: 3,),
                       ksize10,
                       Text('Bank Name',style: inter1.copyWith(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blueGrey),),
                       Text('Alliance Bank Malaysia Berhad',style: inter1.copyWith(fontWeight: FontWeight.bold,fontSize: 17,)),
                       ksize20,
                       Text('Account Number',style: inter1.copyWith(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blueGrey)),
                       Text('MA098765',style: inter1.copyWith(fontWeight: FontWeight.bold,fontSize: 17,)),
                       ksize10,
                     ],
                   ),
                 ),
               ),
             )
           ],

      ),
    );
  }
}