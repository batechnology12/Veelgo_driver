import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/dashboard/driver_mainscreen.dart';
import 'package:veelgo/login_reg_screens/login.dart';
import 'package:veelgo/properties/common%20properties.dart';

import '../apiCalls.dart';
import '../commonClasses.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  TextEditingController createPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ResetPassowrd _api = ResetPassowrd();

  void changePassword() async {

    if (_formKey.currentState!.validate()) {
      String password = createPassword.text;
      String passwordConfirmation = confirmPassword.text;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.white)),
      );

      try {
        // Retrieve token
        final prefs = await SharedPreferences.getInstance();
        String? authtoken = prefs.getString("fpotp_token");
        print(authtoken);
        print('---------------------');

        // Check if token is available
        // if (authtoken == null) {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) => AlertDialog(
        //       title: Text('Error'),
        //       content: Text('Token not found. Please log in again.'),
        //       actions: <Widget>[
        //         TextButton(
        //           child: Text('OK'),
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //             // Navigate to login screen or handle token expiration
        //           },
        //         ),
        //       ],
        //     ),
        //   );
        //   return;
        // }

        // API endpoint URL
        String apiUrl = 'https://veelgo.digitaldatatechnologia.in/api/resetPassword';

        // HTTP POST request
        var response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $authtoken',
          },
          body: jsonEncode({
            'password': password,
            'password_confirmation': passwordConfirmation,
          }),
        );

        // Check if request was successful (status code 200)
        if (response.statusCode == 200) {
          // Parse the JSON response
          var jsonResponse = jsonDecode(response.body);

          // Check the response status from the API
          if (jsonResponse['status'] == true) {
            Navigator.of(context).pop();
            SnackbarUtils.showSnackbar(context, 'Updated password Succesefully');
            Get.to(LoginPage());
          } else {
            // Handle API response with errors
            Navigator.of(context).pop();
             (context, 'Error Try Again');
          }
        } else {
          // Handle HTTP error
          Navigator.of(context).pop();
          SnackbarUtils.showSnackbar(context, 'Failed to reset');
        }
      } catch (e) {
        // Handle other exceptions
        Navigator.of(context).pop();
        SnackbarUtils.showSnackbar(context, 'Try Again');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 17,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Create New Password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(
                child: SizedBox(
                  height: 180,
                  width: 180,
                  child: SvgPicture.asset(
                    'assets/createpswrd.svg',
                    placeholderBuilder: (BuildContext context) =>
                        CircularProgressIndicator(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Create Password *',
                style: inter1.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.blueGrey,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: createPassword,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != createPassword.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(height: 10),
              Text(
                'Confirm Password *',
                style: inter1.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.blueGrey,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5),

              CustomTextFormField(
                controller: confirmPassword,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != createPassword.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 47,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: changePassword,
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Change Password',
                      style: inter1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


