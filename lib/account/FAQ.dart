

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veelgo/controller/authController.dart';
import 'package:veelgo/properties/common%20properties.dart';

import 'package:http/http.dart' as http;
import '../controller/authController.dart';
import '../modelClasses/faq_services.dart';
import '../networkApiServices/faqApiService.dart';

class AccountFAQ extends StatefulWidget {
  const AccountFAQ({Key? key}) : super(key: key);

  @override
  _AccountFAQState createState() => _AccountFAQState();
}

class _AccountFAQState extends State<AccountFAQ> {
  int _expandedIndex = -1;
  List<FaqData> faqs = [];


  void initState() {
    // TODO: implement initState
    fetchFAQs();
    super.initState();
  }

  Future<void> fetchFAQs() async {

    final response = await http.get(Uri.parse('https://veelgo.digitaldatatechnologia.in/api/faqs'));
    if (response.statusCode == 200) {
      print('fetchedFaq');
      setState(() {
        faqs = FaqServices.fromJson(json.decode(response.body)).data;
        print(faqs);
      });
    } else {
      // Handle error
      print('Failed to load FAQs');
    }

  }

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
          child: faqs.isNotEmpty ?
          ListView.builder(
            itemCount: faqs.length, // Set itemCount to the length of the FAQs list
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
                                      faqs[index].question, // Use the question from the API data
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
                              faqs[index].answer, // Use the answer from the API data
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
          ): const Center(child: CircularLoadingIndicator()),


      ),
    );
  }
}
