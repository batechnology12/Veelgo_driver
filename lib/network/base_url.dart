abstract class BaseApiServices {
  String baseUrl = "https://veelgo.digitaldatatechnologia.in/api/";

  String get loginUrl  => "${baseUrl}login";
  String get registerUrl => "${baseUrl}register";
  String get forgotPasswordUrl => "${baseUrl}ForgetPassword";
  String get fpotpVerificationUrl =>"${baseUrl}verify_otp";
  String get updatePasswordUrl =>"${baseUrl}resetPassword";
  String get profileUrl =>"${baseUrl}update_profile_picture";
  String get updateNricUrl =>"${baseUrl}update_nric_picture";
  String get UpdateAccountUrl =>"${baseUrl}update_bank";
  String get getEarningsUrl =>"${baseUrl}getEarnings";
  String get transactionHistoryUrl =>"${baseUrl}getWalletDetails";
  String get notificationUrl =>"${baseUrl}notifications";
  String get getOngoingOrdersUrl =>"${baseUrl}getOngoingOrders";

  String get getBookingUrl => "${baseUrl}get_driver_bookings";
  String get acceptTask => "${baseUrl}acceptBooking";
  String get faqUrl => "${baseUrl}faqs";
  String get getProfileData => "${baseUrl}getProfile";
  String get editProfile => "${baseUrl}updateProfile";
}


