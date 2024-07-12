abstract class BaseApiServices {
  String baseUrl = "https://veelgo.digitaldatatechnologia.in/api/";

  String get loginUrl  => "${baseUrl}login";
  String get registerUrl => "${baseUrl}register";
  String get forgotPasswordUrl => "${baseUrl}ForgetPassword";
  String get fpotpVerificationUrl =>"${baseUrl}verify_otp";
  String get updatePasswordUrl =>"${baseUrl}resetPassword";
  String get profileUrl =>"${baseUrl}update_profile_picture";
  String get updateNricUrl =>"${baseUrl}update_nric_picture ";




  String get notificationUrl => "${baseUrl}notification";
  String get getBookingUrl => "${baseUrl}get_driver_bookings";
  String get acceptTask => "${baseUrl}acceptBooking";
  String get faqUrl => "${baseUrl}faqs";
  String get getProfileData => "${baseUrl}getProfile";
  String get editProfile => "${baseUrl}updateProfile";
}


