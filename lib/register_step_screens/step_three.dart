import 'package:final_assignment/register_step_screens/step_four.dart';
import 'package:flutter/material.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  int selectedAge = 25; // Default selected age
  final int minAge = 1;
  final int maxAge = 100;

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
              "Step 3 of 7",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "What is your age?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: SizedBox(
                height: 300, // Increase the height of the scroller
                child: ListWheelScrollView.useDelegate(
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedAge = minAge + index;
                    });
                  },
                  perspective: 0.01,
                  itemExtent: 50,
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (BuildContext context, int index) {
                      if (index < 0 || index >= maxAge - minAge + 1) {
                        return null;
                      }
                      final age = minAge + index;
                      final isSelected = age == selectedAge;
                      return Center(
                        child: Text(
                          '$age',
                          style: TextStyle(
                            fontSize: 24,
                            color: isSelected ? Colors.black : Colors.grey,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      );
                    },
                    childCount: maxAge - minAge + 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                'Selected Age: $selectedAge',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StepFour(),
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
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
