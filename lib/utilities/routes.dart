import 'package:ecommerce_app/views/pages/landing_page.dart';
import 'package:ecommerce_app/views/pages/auth_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const landingPageRoute = '/';
  static const loginPageRoute = '/login';
}

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage());
  }
}
