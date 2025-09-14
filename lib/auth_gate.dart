import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
// import 'home_screen.dart'; INI BELUM ADA

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshots) {
        if (!snapshots.hasData) {
          return const LoginPage();
        }

        //return const belum ada;
      },
    );
  }
}