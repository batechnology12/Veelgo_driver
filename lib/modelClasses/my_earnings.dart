// To parse this JSON data, do
//
//     final getEarningModel = getEarningModelFromJson(jsonString);

import 'dart:convert';

GetEarningModel getEarningModelFromJson(String str) => GetEarningModel.fromJson(json.decode(str));

String getEarningModelToJson(GetEarningModel data) => json.encode(data.toJson());

class GetEarningModel {
  bool status;
  String message;
  Datas data;

  GetEarningModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetEarningModel.fromJson(Map<String, dynamic> json) => GetEarningModel(
    status: json["status"],
    message: json["message"],
    data: Datas.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Datas {
  String totalCreditAmount;
  int totalOrders;
  List<CreditHistory> creditHistory;

  Datas({
    required this.totalCreditAmount,
    required this.totalOrders,
    required this.creditHistory,
  });

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
    totalCreditAmount: json["total_credit_amount"],
    totalOrders: json["total_orders"],
    creditHistory: List<CreditHistory>.from(json["credit_history"].map((x) => CreditHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_credit_amount": totalCreditAmount,
    "total_orders": totalOrders,
    "credit_history": List<dynamic>.from(creditHistory.map((x) => x.toJson())),
  };
}

class CreditHistory {
  int id;
  String userId;
  String bookingId;
  String bookingShowId;
  String referenceNumber;
  String amount;
  String transactionType;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  CreditHistory({
    required this.id,
    required this.userId,
    required this.bookingId,
    required this.bookingShowId,
    required this.referenceNumber,
    required this.amount,
    required this.transactionType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreditHistory.fromJson(Map<String, dynamic> json) => CreditHistory(
    id: json["id"]??0,
    userId: json["user_id"]??"",
    bookingId: json["booking_id"]??"",
    bookingShowId: json["booking_show_id"]??"",
    referenceNumber: json["reference_number"]??"",
    amount: json["amount"]??"",
    transactionType: json["transaction_type"]??"",
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]??""),
    updatedAt: DateTime.parse(json["updated_at"]??""),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "booking_id": bookingId,
    "booking_show_id": bookingShowId,
    "reference_number": referenceNumber,
    "amount": amount,
    "transaction_type": transactionType,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
