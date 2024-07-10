// To parse this JSON data, do
//
//     final faqServices = faqServicesFromJson(jsonString);

import 'dart:convert';

FaqServices faqServicesFromJson(String str) => FaqServices.fromJson(json.decode(str));

String faqServicesToJson(FaqServices data) => json.encode(data.toJson());

class FaqServices {
  bool status;
  String message;
  List<FaqData> data;

  FaqServices({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FaqServices.fromJson(Map<String, dynamic> json) => FaqServices(
    status: json["status"],
    message: json["message"],
    data: List<FaqData>.from(json["data"].map((x) => FaqData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FaqData {
  int id;
  String question;
  String answer;

  FaqData({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FaqData.fromJson(Map<String, dynamic> json) => FaqData(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "answer": answer,
  };
}
