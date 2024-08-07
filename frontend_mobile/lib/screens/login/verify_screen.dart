import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/screens/login/logic/otp_logic.dart';
import 'package:frontend_mobile/screens/login/logic/user_input_logic.dart';
import 'package:frontend_mobile/screens/login/services/auth_service.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:provider/provider.dart';

class VerifyPage extends StatefulWidget {
  final String username;
  final String password;

  const VerifyPage({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final List<String> _otp = [
    '',
    '',
    '',
    '',
    '',
    ''
  ]; // List to store individual OTP digits

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<OtpProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // curve style
                Image.asset(AppImage.upperStyle),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Config.spaceLarge,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImage.verifyEmailImg,
                              width: 250,
                            ),
                          ),
                          const SizedBox(
                              height: 40), // Space for the back button
                          Text(
                            AppText.enText['verify_title']!,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            AppText.enText['verify_text']!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextButton(
                            onPressed: () {
                              authService.getOTP(
                                  context: context,
                                  username: widget.username,
                                  password: widget.password);
                            },
                            child: const Text("Resend"),
                          ),
                          Config.spaceSmall,
                          // Row for separate OTP boxes
                          Form(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                6,
                                (index) => _otpTextField(index),
                              ),
                            ),
                          ),
                          Config.spaceLarge,
                          ElevatedButton(
                            onPressed: () {
                              final otpCode = _otp.join('');
                              if (otpCode.isNotEmpty) {
                                authService.getToken(
                                    context: context,
                                    username: widget.username,
                                    otpCode:
                                        otpCode); // Pass the combined OTP code
                              } else {
                                showSnackBar(context, 'OTP code is empty');
                              }
                            },
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Text(AppText.enText['continue_button']!),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to create individual OTP text field
  Widget _otpTextField(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      height: 53,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[400]!, // #DDDDDD color
          width: 1.6,
        ),
      ),
      child: TextFormField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
          counterText: "", // Hide the default character counter
          border: InputBorder.none, // Remove default border
        ),
        onChanged: (value) {
          setState(() {
            _otp[index] = value;
            // Move focus to the next box if a digit is entered
            if (value.isNotEmpty && index < 5) {
              FocusScope.of(context).nextFocus();
            }
          });
        },
      ),
    );
  }
}
