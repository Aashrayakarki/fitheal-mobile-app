import 'package:final_assignment/common_widget/my_button.dart';
import 'package:final_assignment/common_widget/my_text_form_field.dart';
import 'package:final_assignment/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  String? name;
  String? phone;

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
                'Create an account',
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
                'Please enter your credentials to continue',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Full name:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            MyTextFormField(
              onChanged: (value) {
                name = value;
              },
              text: "Enter your full name",
            ),
            const SizedBox(height: 10),
            const Text(
              "Phone no:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            MyTextFormField(
              onChanged: (value) {
                phone = value;
              },
              text: "Enter your phone number",
            ),
            const SizedBox(height: 10),
            const Text(
              "Email:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            MyTextFormField(
                onChanged: (value) {
                  email = value;
                },
                text: "Enter your email"),
            const SizedBox(height: 10),
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
                text: "Enter your password"),
            const SizedBox(height: 10),
            const Text(
              "Confirm password:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            MyTextFormField(
                onChanged: (value) {
                  password = value;
                },
                text: "Enter your password again"),
            const SizedBox(height: 16),
            MyButton(
                text: "Create Account", color: Colors.orange, onPressed: () {}),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
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
