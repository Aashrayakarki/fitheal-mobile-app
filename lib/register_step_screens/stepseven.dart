import 'package:final_assignment/register_step_screens/get_started.dart';
import 'package:flutter/material.dart';

class StepSeven extends StatefulWidget {
  const StepSeven({super.key});

  @override
  State<StepSeven> createState() => _StepSevenState();
}

class _StepSevenState extends State<StepSeven> {
  String selectedGoal = ''; // Default selected goal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Step 7 of 7",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "What's your goal?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 80),
            _buildGoalOption('Lose Weight', Icons.line_weight),
            const SizedBox(height: 10),
            _buildGoalOption('Gain Muscle', Icons.fitness_center),
            const SizedBox(height: 10),
            _buildGoalOption('Improve Fitness', Icons.sports_gymnastics),
            const SizedBox(height: 80),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GetStarted(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: const Text(
                  'FINISH ALL STEPS',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalOption(String goal, IconData iconData) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGoal = goal;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selectedGoal == goal ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: selectedGoal == goal ? Colors.white : Colors.black,
              size: 24,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                goal,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: selectedGoal == goal ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: selectedGoal == goal
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
