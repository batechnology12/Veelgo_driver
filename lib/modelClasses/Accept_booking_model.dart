import 'dart:convert';

AcceptBookingdata acceptBookingdataFromJson(String str) =>
    AcceptBookingdata.fromJson(json.decode(str));

String acceptBookingdataToJson(AcceptBookingdata data) =>
    json.encode(data.toJson());

class AcceptBookingdata {
  bool status;
  String message;
  AcceptBookingData data;

  AcceptBookingdata({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AcceptBookingdata.fromJson(Map<String, dynamic> json) =>
      AcceptBookingdata(
        status: json["status"],
        message: json["message"],
        data: AcceptBookingData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class AcceptBookingData {
  int id;
  String bookingId;
  String userId;
  String driverId;
  dynamic vehicleId;
  DateTime bookingDate;
  String pickupOtp;
  String deliveryOtp;
  String bookingType;
  String deliveryTypeId;
  String paymentMode;
  String bookingAmount;
  String isRoundTrip;
  dynamic parcelPhoto;
  String gst;
  String additionalTotal;
  String totalAmount;
  dynamic additionalServicesId;
  dynamic notes;
  int isConfirmed;
  String isPickuped;
  int bookingStatus;
  dynamic pickupAddreess;
  String latitude;
  String longitude;
  String distance;
  dynamic pickupedAt;
  DateTime acceptedAt;
  dynamic completedAt;
  dynamic packagePictures;
  DateTime createdAt;
  DateTime updatedAt;

  AcceptBookingData({
    required this.id,
    required this.bookingId,
    required this.userId,
    required this.driverId,
    required this.vehicleId,
    required this.bookingDate,
    required this.pickupOtp,
    required this.deliveryOtp,
    required this.bookingType,
    required this.deliveryTypeId,
    required this.paymentMode,
    required this.bookingAmount,
    required this.isRoundTrip,
    required this.parcelPhoto,
    required this.gst,
    required this.additionalTotal,
    required this.totalAmount,
    required this.additionalServicesId,
    required this.notes,
    required this.isConfirmed,
    required this.isPickuped,
    required this.bookingStatus,
    required this.pickupAddreess,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.pickupedAt,
    required this.acceptedAt,
    required this.completedAt,
    required this.packagePictures,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AcceptBookingData.fromJson(Map<String, dynamic> json) =>
      AcceptBookingData(
        id: json["id"] ?? 0,
        bookingId: json["booking_id"] ?? "",
        userId: json["user_id"] ?? "",
        driverId: json["driver_id"] ?? "",
        vehicleId: json["vehicle_id"] ?? "",
        bookingDate: DateTime.parse(json["booking_date"]),
        pickupOtp: json["pickup_otp"] ?? "",
        deliveryOtp: json["delivery_otp"] ?? "",
        bookingType: json["booking_type"] ?? "",
        deliveryTypeId: json["delivery_type_id"] ?? "",
        paymentMode: json["payment_mode"] ?? "",
        bookingAmount: json["booking_amount"] ?? "",
        isRoundTrip: json["is_round_trip"] ?? "",
        parcelPhoto: json["parcel_photo"] ?? "",
        gst: json["gst"] ?? "",
        additionalTotal: json["additional_total"] ?? "",
        totalAmount: json["total_amount"] ?? "",
        additionalServicesId: json["additional_services_id"] ?? "",
        notes: json["notes"] ?? "",
        isConfirmed: json["is_confirmed"] ?? "",
        isPickuped: json["is_pickuped"] ?? "",
        bookingStatus: json["booking_status"] ?? "",
        pickupAddreess: json["pickup_addreess"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        distance: json["distance"] ?? "",
        pickupedAt: json["pickuped_at"] ?? "",
        acceptedAt: DateTime.parse(json["accepted_at"]),
        completedAt: json["completed_at"] ?? "",
        packagePictures: json["package_pictures"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "user_id": userId,
        "driver_id": driverId,
        "vehicle_id": vehicleId,
        "booking_date":
            "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
        "pickup_otp": pickupOtp,
        "delivery_otp": deliveryOtp,
        "booking_type": bookingType,
        "delivery_type_id": deliveryTypeId,
        "payment_mode": paymentMode,
        "booking_amount": bookingAmount,
        "is_round_trip": isRoundTrip,
        "parcel_photo": parcelPhoto,
        "gst": gst,
        "additional_total": additionalTotal,
        "total_amount": totalAmount,
        "additional_services_id": additionalServicesId,
        "notes": notes,
        "is_confirmed": isConfirmed,
        "is_pickuped": isPickuped,
        "booking_status": bookingStatus,
        "pickup_addreess": pickupAddreess,
        "latitude": latitude,
        "longitude": longitude,
        "distance": distance,
        "pickuped_at": pickupedAt,
        "accepted_at": acceptedAt.toIso8601String(),
        "completed_at": completedAt,
        "package_pictures": packagePictures,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
