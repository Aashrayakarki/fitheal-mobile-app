import 'package:final_assignment/common_widget/my_text_form_field.dart';
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
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot password?",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
