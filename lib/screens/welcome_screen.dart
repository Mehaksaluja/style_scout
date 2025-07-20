import 'package:flutter/material.dart';
import 'package:style_scout/screens/auth_screen.dart';
// Import the HomeScreen
import 'package:style_scout/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF16162D), Color(0xFF0F0F23)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.style, color: Color(0xFFE94560), size: 40),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome to\nStyle Scout',
                    style: theme.textTheme.displayLarge?.copyWith(
                      fontSize: 44,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your personal AI fashion assistant. Snap a photo, find your style.',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AuthScreen(isLoginMode: false),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                    ),
                    child: const Text('Get Started'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AuthScreen(isLoginMode: true),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.1),
                      elevation: 0,
                    ),
                    child: const Text('I already have an account'),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: TextButton(
                      // --- THIS IS THE FIX ---
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Continue as Guest',
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
