import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veelgo/properties/common%20properties.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined, size: 17),
        ),
        title: Text(
          'Frequently Asked Questions',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 8, // Adjust itemCount as needed
          itemBuilder: (BuildContext context, int index) {
            return Container(

              child: ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _expandedIndex = isExpanded ? -1 : index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(

                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'What is ${isExpanded ? 'Potea ?' : 'Potea ?'}',
                                    style: poppins1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            'This is the detailed content that can be shown or hidden.',
                            style: poppins1.copyWith(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    isExpanded: _expandedIndex == index,
                    canTapOnHeader: true,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
