import 'package:ecommerce/controllers/database_controller.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/utilites/routes.dart';
import 'package:ecommerce/views/pages/auth.dart';
import 'package:ecommerce/views/pages/bottom_navbar.dart';
import 'package:ecommerce/views/pages/checkout/add_shipping_address.dart';
import 'package:ecommerce/views/pages/checkout/checkout_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views/pages/landing_page.dart';
import '../views/pages/product_details.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(builder: (_) => const AuthPage());
    case AppRoutes.addShippingAddressRoute:
      final database = settings.arguments as Database;
      return CupertinoPageRoute(
          builder: (_) => Provider<Database>.value(
              value: database, child: const AddShippingAddressPage()));
    case AppRoutes.bottomNavBarRoute:
      final args = settings.arguments as Map<String, dynamic>;
      final database = args['database'];
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
            value: database, child: const BottomNavBar()),
        settings: settings,
      );
    case AppRoutes.checkOutPageRoute:
      final database = settings.arguments as Database;

      return CupertinoPageRoute(
          builder: (_) => Provider<Database>.value(
              value: database, child: const CheckOutPage()));
    case AppRoutes.productDetailsRoute:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      final database = args['database'];
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: ProductDetails(product: product),
        ),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
  }
}
