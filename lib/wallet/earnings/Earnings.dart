import 'package:flutter/material.dart';

import '../../properties/common properties.dart';

class Earnings extends StatefulWidget {
  const Earnings({super.key});

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(

              margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(Icons.access_time,color: Colors.red,),
                title: Row(
                  children: [
                    Text('Booking ID : ',style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.w700,color: AppColors.bluegrey),),
                    Text('#ZAGO1',style: inter1.copyWith(fontSize: 15,fontWeight: FontWeight.w700),),
                  ],
                ),
                subtitle: Text('4.30PM TO 6.00PM'), // Example subtitle
                trailing: Text('\$+25',style: inter1.copyWith(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 15),),
                onTap: () {
                  // Handle onTap event
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
