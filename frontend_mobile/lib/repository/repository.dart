import 'package:frontend_mobile/screens/login/services/auth_service.dart';

class Repository {
  final AuthService authService;
  Repository(this.authService);

  Future<void> getToken(context, username) =>
      authService.getToken(context: context, username: username, otpCode: '');
}
