import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_service.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, bool>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<bool> {
  final Ref _ref;

  LoginNotifier(this._ref) : super(false);

  Future<void> login(String email, String password) async {
    final token = await _ref.read(loginServiceProvider).login(email, password);

    if (token != null) {
      state = true;
      // Store the token using shared preferences or any secure storage
    } else {
      state = false;
    }
  }
}

final loginServiceProvider = Provider<LoginService>((ref) {
  return LoginService();
});
