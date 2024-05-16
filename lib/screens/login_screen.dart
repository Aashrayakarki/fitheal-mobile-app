import 'package:final_assignment/common_widget/my_button.dart';
import 'package:final_assignment/common_widget/my_text_form_field.dart';
import 'package:final_assignment/screens/dashboard_screen.dart';
import 'package:final_assignment/screens/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome to Fitheal!!!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello there, sign in to continue!',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Email address:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            MyTextFormField(
              onChanged: (value) {
                email = value;
              },
              text: "Enter your email",
            ),
            const SizedBox(height: 16),
            const Text(
              "Password:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            MyTextFormField(
              onChanged: (value) {
                password = value;
              },
              text: "Enter your password",
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Navigate to the forgot password page here
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24),
            MyButton(
              text: "Login",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                );
              },
              color: Colors.orange,
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.center,
              child: Text("Or Login with"),
            ),
            const SizedBox(height: 24),
            MyButton(
                text: "Connect with Google",
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {},
                iconAsset: 'assets/icons/google.ico'),
            const SizedBox(height: 24),
            MyButton(
              text: "Connect with Facebook",
              textColor: Colors.white,
              color: const Color.fromARGB(243, 0, 70, 221),
              onPressed: () {},
              iconAsset: 'assets/icons/facebook.ico',
              iconSize: 32,
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
