abstract class BaseApiServices {
  String baseUrl = "https://veelgo.digitaldatatechnologia.in/api/";

  String get notificationUrl => "${baseUrl}notification";
  String get getBookingUrl => "${baseUrl}get_driver_bookings";
  String get latestBookingUrl => "${baseUrl}getLatestBookingsByLocation";
  String get acceptBookingUrl => "${baseUrl}acceptBooking";
  String get locationupdateapi => "${baseUrl}update_location";
  String get acceptbookingurl => "${baseUrl}acceptBooking";
  String get getProfileData => "${baseUrl}getProfile";
  String get conformpickupurl => "${baseUrl}pickupBooking";
  String get conformdeliveryoderurl => "${baseUrl}completeBooking";
}
