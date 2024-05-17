import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(235, 249, 147, 84),
              Colors.white,
              Color.fromARGB(235, 249, 147, 84),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.center,
                  child: Image(image: AssetImage("assets/images/fitheal.png")))
            ],
          ),
        ),
      ),
    );
  }
}
