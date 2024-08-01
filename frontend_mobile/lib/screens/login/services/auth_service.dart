import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/model/cv/user_model.dart';
import 'package:frontend_mobile/provider/user_provider.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/login/logic/otp_logic.dart';
import 'package:frontend_mobile/screens/login/services/token_service.dart';
import 'package:frontend_mobile/screens/login/verify_screen.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> registration(
      {required BuildContext context,
      required String username,
      required String password,
      required String email}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      User user = User(email: email, username: username);
      // trim input and convert to lowercase
      email = email.trim().toLowerCase();
      var response = await http.post(
        Uri.parse(APIEndPoint.baseUrl +
            APIEndPoint.version +
            APIEndPoint.authEndPoint.register),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            "email": email,
            "username": username,
            "password": password,
            "social_registration": 0
          },
        ),
      );
      debugPrint("User provider: ");
      debugPrint(email);
      debugPrint(username);
      debugPrint(response.body);
      if (!context.mounted) return;

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          showSnackBar(context, 'Signed Up!');

          getOTP(context: context, username: username, password: password);

          // Navigator.popUntil(
          //     context, ModalRoute.withName(LoginScreen.routeName));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Future <void> logIn ({
  //   required String username,
  //   required String password
  // }) async {

  // }
  Future<void> logIn({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final tokenService = TokenService();

    if (username.isEmpty || password.isEmpty) {
      showSnackBar(context, 'Username or password cannot be empty');
      return;
    }

    try {
      var response = await http.post(
        Uri.parse(APIEndPoint.baseUrl +
            APIEndPoint.version +
            APIEndPoint.authEndPoint.login),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            "username_or_email": username,
            "password": password,
          },
        ),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          final data = jsonDecode(response.body);
          final body = data['body'] ?? {'test': 'test'};

          String code = body['code'] ?? '';
          if (code.isNotEmpty) {
            showSnackBar(context, 'OTP code sent: $code');

            // Navigate to OTP verification screen
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    VerifyPage(username: username, password: password)));
          } else {
            showSnackBar(context, 'Code is missing from response');
          }
        },
      );
    } catch (e) {
      showSnackBar(context, "error");
      print(e.toString());
    }
  }

  Future<void> socialLogIn(
      {required String username, required String password}) async {}

  Future<void> getOTP({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    final otpProvider = Provider.of<OtpProvider>(context,
        listen: false); // Get the provider without rebuilding on changes
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      var response = await http.post(
          Uri.parse(APIEndPoint.baseUrl +
              APIEndPoint.version +
              APIEndPoint.authEndPoint.login),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(
              {"username_or_email": username, "password": password}));
      debugPrint(response.body);
      if (!context.mounted) return;
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          showSnackBar(context, 'Email Sent!');
          final data = jsonDecode(response.body);
          String code = data['body']['code'] ?? 'non';
          debugPrint("Success $code");
          otpProvider.code = code; // Update the code in the Provider
          // Navigator.pushNamed(context, RouteManager.verifyScreen,
          // arguments: {'username': username, 'password': password});
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  VerifyPage(username: username, password: password)));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getToken({
    required BuildContext context,
    required String username, required String otpCode
  }) async {
    final otpProvider = Provider.of<OtpProvider>(context, listen: false);
    final tokenService = TokenService();

    try {
      debugPrint(username);
      debugPrint(otpCode);

      var response = await http.post(
        Uri.parse(APIEndPoint.baseUrl +
            APIEndPoint.version +
            APIEndPoint.authEndPoint.getToken),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          {'username_or_email': username, 'code': otpCode},
        ),
      );

      if (!context.mounted) return;

      debugPrint(response.body);

      // Handle the response using the httpErrorHandle function
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          final data = jsonDecode(response.body);
          final body = data['body'] ?? {};

          // Extract tokens from the response body
          String accessToken = body['access_token'] ?? '';
          String refreshToken = body['refresh_token'] ?? '';

          // Check if tokens are present
          if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
            // Save tokens using TokenService
            await tokenService.saveTokens(accessToken, refreshToken);
            debugPrint('Access Token: $accessToken');
            debugPrint('Refresh Token: $refreshToken');
            String? accessToken1 = await tokenService.getAccessToken();
            String? refreshToken1 = await tokenService.getRefreshToken();

            if (accessToken != null) {
              print('Access Token WORK NOW: $accessToken1');
              print('Refresh Token WORK NOW: $refreshToken1');
            } else {
              print('No access token found.');
            }
            Navigator.of(context).popAndPushNamed(RouteManager.navigationMenu);
          } else {
            showSnackBar(context, 'Access or Refresh Token is missing');
          }
        },
      );
    } catch (e) {
      showSnackBar(context, 'Error: ${e.toString()}');
      debugPrint('Error: ${e.toString()}');
    }
  }
}
