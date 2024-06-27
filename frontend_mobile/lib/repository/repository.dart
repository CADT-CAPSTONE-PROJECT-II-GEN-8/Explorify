import 'package:frontend_mobile/model/user/token_model.dart';
import 'package:frontend_mobile/screens/login/services/auth_service.dart';

class Repository {
  final AuthService authService;
  Repository(this.authService);

  Future<TokenModel> getToken(context, username) =>
      authService.getToken(context: context, username: username);
}
