import 'package:ecommerce/controllers/database_controller.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/views/pages/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../services/firestore_services.dart';
import 'bottom_navbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return ChangeNotifierProvider<AuthController>(
                  create: (_) => AuthController(auth: auth),
                  child: const AuthPage());
            }
            return ChangeNotifierProvider<AuthController>(
              create: (_) => AuthController(auth: auth),
              child: Provider<Database>(
                  create: (_) => FireStoreDatabase(user.uid),
                  child: const BottomNavBar()),
            );
          }

          ///TODO: We Will Refactor This
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
