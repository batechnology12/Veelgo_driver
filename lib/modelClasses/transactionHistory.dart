// To parse this JSON data, do
//
//     final getTransactionModel = getTransactionModelFromJson(jsonString);

import 'dart:convert';

GetTransactionModel getTransactionModelFromJson(String str) => GetTransactionModel.fromJson(json.decode(str));

String getTransactionModelToJson(GetTransactionModel data) => json.encode(data.toJson());

class GetTransactionModel {
  bool status;
  String message;
  historyData data;

  GetTransactionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetTransactionModel.fromJson(Map<String, dynamic> json) => GetTransactionModel(
    status: json["status"],
    message: json["message"],
    data: historyData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class historyData {
  int totalCredits;
  int totalDebits;
  int walletBalance;
  List<WalletHistory> walletHistory;

  historyData({
    required this.totalCredits,
    required this.totalDebits,
    required this.walletBalance,
    required this.walletHistory,
  });

  factory historyData.fromJson(Map<String, dynamic> json) => historyData(
    totalCredits: json["total_credits"],
    totalDebits: json["total_debits"],
    walletBalance: json["wallet_balance"],
    walletHistory: List<WalletHistory>.from(json["wallet_history"].map((x) => WalletHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_credits": totalCredits,
    "total_debits": totalDebits,
    "wallet_balance": walletBalance,
    "wallet_history": List<dynamic>.from(walletHistory.map((x) => x.toJson())),
  };
}

class WalletHistory {
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

  WalletHistory({
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

  factory WalletHistory.fromJson(Map<String, dynamic> json) => WalletHistory(
    id: json["id"]??0,
    userId: json["user_id"]??"",
    bookingId: json["booking_id"]??"",
    bookingShowId: json["booking_show_id"]??"",
    referenceNumber: json["reference_number"]??"",
    amount: json["amount"]??"",
    transactionType: json["transaction_type"]??"",
    status: json["status"]??"",
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
