// To parse this JSON data, do
//
//     final getOngoingOrders = getOngoingOrdersFromJson(jsonString);

import 'dart:convert';

GetOngoingOrders getOngoingOrdersFromJson(String str) => GetOngoingOrders.fromJson(json.decode(str));

String getOngoingOrdersToJson(GetOngoingOrders data) => json.encode(data.toJson());

class GetOngoingOrders {
  bool status;
  String message;
  OngoingData data;

  GetOngoingOrders({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetOngoingOrders.fromJson(Map<String, dynamic> json) => GetOngoingOrders(
    status: json["status"],
    message: json["message"],
    data: OngoingData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class OngoingData {
  List<Order> orders;

  OngoingData({
    required this.orders,
  });

  factory OngoingData.fromJson(Map<String, dynamic> json) => OngoingData(
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
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
  String isConfirmed;
  String isPickuped;
  String bookingStatus;
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
  List<BookingProduct> bookingProducts;
  List<BookingDeliveryAddress> bookingDeliveryAddresses;

  Order({
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
    required this.bookingProducts,
    required this.bookingDeliveryAddresses,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"]??0,
    bookingId: json["booking_id"]??"",
    userId: json["user_id"]??"",
    driverId: json["driver_id"]??"",
    vehicleId: json["vehicle_id"]??"",
    bookingDate: DateTime.parse(json["booking_date"]??""),
    pickupOtp: json["pickup_otp"]??"",
    deliveryOtp: json["delivery_otp"]??"",
    bookingType: json["booking_type"]??"",
    deliveryTypeId: json["delivery_type_id"]??"",
    paymentMode: json["payment_mode"]??"",
    bookingAmount: json["booking_amount"]??"",
    isRoundTrip: json["is_round_trip"]??"",
    parcelPhoto: json["parcel_photo"]??"",
    gst: json["gst"]??"",
    additionalTotal: json["additional_total"]??"",
    totalAmount: json["total_amount"]??"",
    additionalServicesId: json["additional_services_id"]??"",
    notes: json["notes"]??"",
    isConfirmed: json["is_confirmed"]??"",
    isPickuped: json["is_pickuped"]??"",
    bookingStatus: json["booking_status"]??"",
    pickupAddreess: json["pickup_addreess"]??"",
    latitude: json["latitude"]??"",
    longitude: json["longitude"]??"",
    distance: json["distance"]??"",
    pickupedAt: json["pickuped_at"]??"",
    acceptedAt: DateTime.parse(json["accepted_at"]??""),
    completedAt: json["completed_at"]??"",
    packagePictures: json["package_pictures"]??"",
    createdAt: DateTime.parse(json["created_at"]??""),
    updatedAt: DateTime.parse(json["updated_at"]??""),
    bookingProducts: List<BookingProduct>.from(json["booking_products"].map((x) => BookingProduct.fromJson(x))??{}),
    bookingDeliveryAddresses: List<BookingDeliveryAddress>.from(json["booking_delivery_addresses"].map((x) => BookingDeliveryAddress.fromJson(x))??{}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "user_id": userId,
    "driver_id": driverId,
    "vehicle_id": vehicleId,
    "booking_date": "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
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
    "booking_products": List<dynamic>.from(bookingProducts.map((x) => x.toJson())),
    "booking_delivery_addresses": List<dynamic>.from(bookingDeliveryAddresses.map((x) => x.toJson())),
  };
}

class BookingDeliveryAddress {
  int id;
  String bookingId;
  String customerName;
  String customerMobile;
  String unitnoBlockno;
  String address;
  String postalcode;
  String latitude;
  String longitude;
  String deliveryStatus;
  DateTime createdAt;
  DateTime updatedAt;

  BookingDeliveryAddress({
    required this.id,
    required this.bookingId,
    required this.customerName,
    required this.customerMobile,
    required this.unitnoBlockno,
    required this.address,
    required this.postalcode,
    required this.latitude,
    required this.longitude,
    required this.deliveryStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingDeliveryAddress.fromJson(Map<String, dynamic> json) => BookingDeliveryAddress(
    id: json["id"],
    bookingId: json["booking_id"],
    customerName: json["customer_name"],
    customerMobile: json["customer_mobile"],
    unitnoBlockno: json["unitno_blockno"],
    address: json["address"],
    postalcode: json["postalcode"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    deliveryStatus: json["delivery_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "customer_name": customerName,
    "customer_mobile": customerMobile,
    "unitno_blockno": unitnoBlockno,
    "address": address,
    "postalcode": postalcode,
    "latitude": latitude,
    "longitude": longitude,
    "delivery_status": deliveryStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class BookingProduct {
  int id;
  String bookingId;
  String bookingProductId;
  String parcelItems;
  String parcelSize;
  dynamic productPicture;
  String length;
  String bookingProductWith;
  String height;
  String qty;
  String kg;
  String pickuptimeFrom;
  String pickuptimeTo;
  String deliveryDate;
  String deliverytimeFrom;
  String deliverytimeTo;
  DateTime createdAt;
  DateTime updatedAt;

  BookingProduct({
    required this.id,
    required this.bookingId,
    required this.bookingProductId,
    required this.parcelItems,
    required this.parcelSize,
    required this.productPicture,
    required this.length,
    required this.bookingProductWith,
    required this.height,
    required this.qty,
    required this.kg,
    required this.pickuptimeFrom,
    required this.pickuptimeTo,
    required this.deliveryDate,
    required this.deliverytimeFrom,
    required this.deliverytimeTo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingProduct.fromJson(Map<String, dynamic> json) => BookingProduct(
    id: json["id"],
    bookingId: json["booking_id"],
    bookingProductId: json["booking_product_id"],
    parcelItems: json["parcel_items"],
    parcelSize: json["parcel_size"],
    productPicture: json["product_picture"],
    length: json["length"],
    bookingProductWith: json["with"],
    height: json["height"],
    qty: json["qty"],
    kg: json["kg"],
    pickuptimeFrom: json["pickuptime_from"],
    pickuptimeTo: json["pickuptime_to"],
    deliveryDate: json["delivery_date"],
    deliverytimeFrom: json["deliverytime_from"],
    deliverytimeTo: json["deliverytime_to"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "booking_product_id": bookingProductId,
    "parcel_items": parcelItems,
    "parcel_size": parcelSize,
    "product_picture": productPicture,
    "length": length,
    "with": bookingProductWith,
    "height": height,
    "qty": qty,
    "kg": kg,
    "pickuptime_from": pickuptimeFrom,
    "pickuptime_to": pickuptimeTo,
    "delivery_date": deliveryDate,
    "deliverytime_from": deliverytimeFrom,
    "deliverytime_to": deliverytimeTo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
