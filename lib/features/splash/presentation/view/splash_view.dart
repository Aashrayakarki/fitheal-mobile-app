import 'package:final_assignment/features/welcome/presentation/viewmodel/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(welcomeViewModelProvider.notifier).openWelcomeView();
    });

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                  'assets/images/fitheal_dark.png'), // Replace with your image path
            ),
            Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
