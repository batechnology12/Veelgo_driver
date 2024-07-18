
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base_url.dart';

class LoginServicesApi extends BaseApiServices {
  final Dio dio = Dio();

  Future<dynamic> login({required String email, required String password}) async {
    try {
      final response = await dio.post(
        loginUrl,
        data: {'email_or_phone': email, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json; charset=UTF-8'}),
      );


      return response;
    } catch (e) {
      if (e is DioError) {
        return e.response ?? Response(requestOptions: RequestOptions(path: ''), statusCode: 500, statusMessage: 'An error occurred');
      } else {
        // Handle other errors
        return Response(requestOptions: RequestOptions(path: ''), statusCode: 500, statusMessage: 'An error occurred');
      }
    }
  }
}
