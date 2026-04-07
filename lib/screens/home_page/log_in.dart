import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class log_inPage extends StatefulWidget {
  const log_inPage({super.key});

  @override
  State<log_inPage> createState() => _log_inPageState();
}

class _log_inPageState extends State<log_inPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // --- LOGIN FUNCTION ---
  Future<void> _handleLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      _navigateToHome();
    } on FirebaseAuthException catch (e) {
      _showError(e.message ?? "Login Failed");
    }
  }

  // --- REGISTRATION FUNCTION (The missing part!) ---
  Future<void> _handleSignUp() async {
    try {
      // This creates the user in Firebase Auth
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      _showError("Account created successfully!");
      _navigateToHome();
    } on FirebaseAuthException catch (e) {
      _showError(e.message ?? "Registration Failed");
    }
  }

  void _navigateToHome() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage(userName: 'Tisha')),
      );
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Center(
              child: Text("Budget Bee",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const SizedBox(height: 100),

            // EMAIL
            _inputField("Email", _emailController, false),
            const SizedBox(height: 10),

            // PASSWORD
            _inputField("Password", _passwordController, true),

            const SizedBox(height: 20),

            // LOGIN BUTTON
            ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text("Log In", style: TextStyle(color: Colors.white)),
            ),

            // SIGN UP BUTTON (New)
            TextButton(
              onPressed: _handleSignUp,
              child: const Text("Sign Up",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to keep the UI code clean
  Widget _inputField(String label, TextEditingController controller, bool obscure) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}