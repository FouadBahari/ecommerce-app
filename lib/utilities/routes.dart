import 'package:ecommerce_app/views/pages/bottom_nav_bar.dart';
import 'package:ecommerce_app/views/pages/landing_page.dart';
import 'package:ecommerce_app/views/pages/auth_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const landingPageRoute = '/';
  static const loginPageRoute = '/login';
  static const bottomNavBarRoute = '/navbar';
}

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(builder: (_) => const AuthPage(), settings: settings);
    case AppRoutes.bottomNavBarRoute:
      return MaterialPageRoute(builder: (_) => const BottomNavBar(), settings:  settings);
    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage(), settings: settings);
  }
}
