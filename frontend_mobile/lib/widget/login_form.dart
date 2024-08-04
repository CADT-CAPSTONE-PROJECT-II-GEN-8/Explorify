import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/provider/obsure_text_provider.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void logInUser() {
    if (_formKey.currentState!.validate()) {
      authService.logIn(
        context: context,
        username: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isObscureProvider = Provider.of<IsObscureProvider>(context);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
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
              // validator: validateEmail,
              controller: emailController,
              decoration: formDecoration(
                context: context,
                labelText: '',
                prefixIcon: Icons.email,
                suffixIcon: false,
                hintText: "Enter your email address",
              ),
              // obscureText: isObscureProvider.isObscure ? true : false,
            ),
            const SizedBox(height: 12),
            Text(
              "Password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              // validator: validatePassword,
              controller: passwordController,
              decoration: formDecoration(
                context: context,
                labelText: '',
                prefixIcon: Icons.lock,
                suffixIcon: true,
                hintText: "Enter your password",
              ),
              obscureText: isObscureProvider.isObscure,
            ),
<<<<<<< HEAD
            const SizedBox(height: 12),
=======
            Config.spaceSmall,
>>>>>>> mobile/ArticalScreen
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColor.error),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: logInUser,
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(AppText.enText['signIn-button']!),
            ),
          ],
        ),
      ),
    );
  }
}
