import 'package:final_assignment/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay navigation to GridViewScreen by 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                  'assets/images/Fitheal.png'), // Replace with your image path
            ),
            Text("Welcome!!!"),
          ],
        ),
      ),
    );
  }
}
