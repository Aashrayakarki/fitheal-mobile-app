import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0), // Adjust the padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to Fitheal',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8), // Space between the texts
            Text(
              'Hello there, sign in to continue!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey, // Optional: style for the subtext
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
