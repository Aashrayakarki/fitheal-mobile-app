import 'package:final_assignment/register_step_screens/step_one.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // themes
      home: StepOne(),
    );
  }
}
