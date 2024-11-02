import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'utils/config.dart';
import 'pages/landing_page.dart';
import 'pages/home_page.dart';

class RettxApp extends StatefulWidget {
  final Auth0? auth0;
  const RettxApp({this.auth0, final Key? key}) : super(key: key);

  @override
  State<RettxApp> createState() => _RettxAppState();
}

class _RettxAppState extends State<RettxApp> {
  UserProfile? _user;

  late Auth0 auth0;
  late Auth0Web auth0Web;

  @override
  void initState() {
    super.initState();
    auth0 = widget.auth0 ?? Auth0(auth0Domain, auth0ClientId);
    auth0Web = Auth0Web(auth0Domain, auth0ClientId);

    if (kIsWeb) {
      auth0Web.onLoad().then((credentials) {
        setState(() {
          _user = credentials?.user;
        });
      });
    }
  }

  Future<void> login() async {
    try {
      if (kIsWeb) {
        return auth0Web.loginWithRedirect(redirectUrl: redirectUri);
      }

      var credentials = await auth0
          .webAuthentication(scheme: auth0CustomScheme)
          .login(useHTTPS: true);

      setState(() {
        _user = credentials.user;
      });
    } catch (e) {
      developer.log('Login error: $e', name: 'login');
    }
  }

  Future<void> logout() async {
    try {
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: redirectUri);
      } else {
        await auth0
            .webAuthentication(scheme: auth0CustomScheme)
            .logout(useHTTPS: true);
        setState(() {
          _user = null;
        });
      }
    } catch (e) {
      developer.log('Logout error: $e', name: 'logout');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _user == null
          ? LandingPage(onLogin: login)
          : HomePage(user: _user!, onLogout: logout),
    );
  }
}
