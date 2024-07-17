import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/provider/obsure_text_provider.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/login/services/auth_service.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/validators.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void logInUser() {
    authService.logIn;
  }

  @override
  Widget build(BuildContext context) {
    final isObscureProvider = Provider.of<IsObscureProvider>(context);

    return Form(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              // textInputAction: TextInputAction.continueAction,
              validator: validateEmail,
              controller: emailController,
              decoration: formDecoration(
                  context: context,
                  labelText: '',
                  prefixIcon: Icons.email,
                  suffixIcon: false,
                  hintText: "Enter your email address"),
              obscureText: isObscureProvider.isObscure ? true : false,
            ),
            const SizedBox(child: Config.spaceSmall),
            Text(
              "Password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              // textInputAction: TextInputAction.continueAction,
              validator: validatePassword,
              controller: passwordController,
              // decoration: formDecoration('', Icons.lock),
              decoration: formDecoration(
                  context: context,
                  labelText: '',
                  prefixIcon: Icons.lock,
                  suffixIcon: true,
                  hintText: "Enter your password"),
              obscureText: isObscureProvider.isObscure,
            ),
            const SizedBox(child: Config.spaceSmall),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Remember Me",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),

                // Forget Password
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColor.error),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            // SIGN IN BUTTON
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, RouteManager.navigationMenu);
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(AppText.enText['signIn-button']!),
            ),
          ],
        ),
      ),
    );
  }
}
