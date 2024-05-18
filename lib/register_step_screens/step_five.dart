import 'package:final_assignment/register_step_screens/stepsix.dart';
import 'package:flutter/material.dart';

class StepFive extends StatefulWidget {
  const StepFive({super.key});

  @override
  State<StepFive> createState() => _StepFiveState();
}

class _StepFiveState extends State<StepFive> {
  bool isKg = true;
  int selectedWeight = 50;
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
              "Step 5 of 7",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "What is your dream weight?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: ToggleButtons(
                isSelected: [isKg, !isKg],
                onPressed: (int index) {
                  setState(() {
                    isKg = index == 0;
                  });
                },
                borderRadius: BorderRadius.circular(10),
                selectedColor: Colors.white,
                fillColor: const Color.fromARGB(255, 83, 83, 83),
                color: const Color.fromARGB(255, 83, 83, 83),
                children: const [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                    child: Text(
                      "Kg",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                    child: Text(
                      "Lbs",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 200,
                  child: ListWheelScrollView.useDelegate(
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedWeight = index + 1;
                      });
                    },
                    itemExtent: 80,
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (BuildContext context, int index) {
                        final weight = index + 1;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedWeight = weight;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: selectedWeight == weight
                                  ? Colors.black
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '$weight ${isKg ? 'kg' : 'lbs'}',
                              style: TextStyle(
                                color: selectedWeight == weight
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: selectedWeight == weight ? 24 : 16,
                                fontWeight: selectedWeight == weight
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: 500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Selected Weight: $selectedWeight ${isKg ? 'kg' : 'lbs'}',
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
                      builder: (context) => const StepSix(),
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
