import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverChatMessage {
  String image; // Change the type to String
  String driverName;
  String time;
  String massage; // Typo: Should be 'message' instead of 'massage'

  String messageType;
  DriverChatMessage({
    required this.messageType,
    required this.driverName,
    required this.image,
    required this.time,
    required this.massage, // Typo: Should be 'message' instead of 'massage'
  });
}


List<DriverChatMessage> driverMessages = [
  DriverChatMessage(
    image: 'assets/profilepic2.png', // Provide the asset path as a String
    messageType: "sender",
    driverName: "Syed",
    time: '1:30PM', massage: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  DriverChatMessage(
    image: 'assets/pro.png', // Provide the asset path as a String
    messageType: "receiver",
    driverName: "Lee Wong",
    time: '1:30PM', massage:    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
];
