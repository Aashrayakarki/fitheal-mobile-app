import 'package:final_assignment/register_step_screens/step_three.dart';
import 'package:flutter/material.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  List<String> selectedActivities = [];

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
              "Step 2 of 7",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Select your favorite activities",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildCheckboxItem(
                    'assets/images/running.png',
                    'Running',
                  ),
                  _buildCheckboxItem(
                    'assets/images/walking.png',
                    'Walking',
                  ),
                  _buildCheckboxItem(
                    'assets/images/yoga.png',
                    'Yoga',
                  ),
                  _buildCheckboxItem(
                    'assets/images/cycling.png',
                    'Cycling',
                  ),
                  _buildCheckboxItem(
                    'assets/images/health.png',
                    'Health',
                  ),
                  _buildCheckboxItem(
                    'assets/images/meal_plan.png',
                    'Meal Plan',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StepThree(),
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
                  'NEXT',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(String imagePath, String label) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: selectedActivities.contains(label),
              onChanged: (bool? value) {
                setState(() {
                  if (value != null && value) {
                    selectedActivities.add(label);
                  } else {
                    selectedActivities.remove(label);
                  }
                });
              },
            ),
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
