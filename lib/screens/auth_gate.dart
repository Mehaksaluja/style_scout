import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:style_scout/screens/home_screen.dart";
import "package:style_scout/screens/welcome_screen.dart";

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        return const WelcomeScreen();
      },
    );
  }
}
