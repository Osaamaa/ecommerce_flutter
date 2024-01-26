import 'package:ecommerce/utilites/routes.dart';
import 'package:ecommerce/views/pages/auth.dart';
import 'package:ecommerce/views/pages/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/pages/landing_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(builder: (_) => const AuthPage());
    case AppRoutes.bottomNavBarRoute:
      return CupertinoPageRoute(builder: (_) => const BottomNavBar());
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
  }
}
