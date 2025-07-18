import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final bool isLoginMode;

  const AuthScreen({super.key, required this.isLoginMode});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late bool _isLogin;

  @override
  void initState() {
    super.initState();

    _isLogin = widget.isLoginMode;
  }

  void _toggleMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // We use an AppBar to provide a back button automatically.
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        // SingleChildScrollView prevents the screen from overflowing
        // when the keyboard appears.
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // --- HEADER ---
            Text(
              _isLogin ? 'Welcome Back,' : 'Create Account,',
              style: theme.textTheme.displayLarge?.copyWith(fontSize: 32),
            ),
            Text(
              _isLogin ? 'Log in to continue' : 'Sign up to get started',
              style: theme.textTheme.headlineSmall?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 48),

            // --- FORM FIELDS ---
            // We will add a TextFormField for the user's name, but only in Sign Up mode.
            if (!_isLogin)
              TextFormField(decoration: _buildInputDecoration('Full Name')),
            if (!_isLogin) const SizedBox(height: 16),

            TextFormField(
              decoration: _buildInputDecoration('Email Address'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: _buildInputDecoration('Password'),
              obscureText: true, // Hides the password text.
            ),
            const SizedBox(height: 32),

            // --- ACTION BUTTON ---
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
              ),
              child: Text(_isLogin ? 'Log In' : 'Sign Up'),
            ),
            const SizedBox(height: 24),

            // --- TOGGLE BUTTON ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isLogin
                      ? "Don't have an account?"
                      : "Already have an account?",
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
                ),
                TextButton(
                  onPressed: _toggleMode,
                  child: Text(
                    _isLogin ? 'Sign Up' : 'Log In',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to create consistent styling for our text fields.
  // This is great for keeping our code DRY (Don't Repeat Yourself).
  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.05),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
