import 'package:final_assignment/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeView extends ConsumerStatefulWidget {
  const WelcomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends ConsumerState<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/images/fitheal.png"),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Start Your Journey Towards \n A More Active Lifestyle',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                color: Colors.transparent,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('|', style: TextStyle(fontSize: 30)),
                        SizedBox(width: 27),
                        Icon(Icons.sports_gymnastics_rounded,
                            size: 40, color: Colors.orange),
                        SizedBox(width: 27),
                        Text('|', style: TextStyle(fontSize: 30)),
                        SizedBox(width: 27),
                        Icon(
                          Icons.book,
                          size: 40,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 27),
                        Text('|', style: TextStyle(fontSize: 30)),
                        SizedBox(width: 27),
                        Icon(Icons.apple, size: 40, color: Colors.orange),
                        SizedBox(width: 27),
                        Text('|', style: TextStyle(fontSize: 30)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Workout'),
                        SizedBox(width: 40),
                        Text('Progress\n Tracking'),
                        SizedBox(width: 40),
                        Text('Nutrition'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color.fromARGB(235, 249, 178, 134),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      ref.read(authViewModelProvider.notifier).openLoginView();
                    },
                    child: const Text(
                      "PROCEED",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
