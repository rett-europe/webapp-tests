import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import '../utils/config.dart';

class AuthService extends ChangeNotifier {
  final Auth0 auth0 = Auth0(auth0Domain, auth0ClientId);
  UserProfile? _user;

  UserProfile? get user => _user;
  bool get isLoggedIn => _user != null;

  Future<void> login() async {
    try {
      final credentials = await auth0
          .webAuthentication(scheme: auth0CustomScheme)
          .login(useHTTPS: true);

      _user = credentials.user;
      notifyListeners();
    } catch (e) {
      debugPrint('Login error: $e');
    }
  }

  Future<void> logout() async {
    try {
      await auth0
          .webAuthentication(scheme: auth0CustomScheme)
          .logout(useHTTPS: true);

      _user = null;
      notifyListeners();
    } catch (e) {
      debugPrint('Logout error: $e');
    }
  }
}
