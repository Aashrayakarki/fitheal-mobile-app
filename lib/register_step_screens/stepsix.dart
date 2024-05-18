import 'package:final_assignment/register_step_screens/stepseven.dart';
import 'package:flutter/material.dart';

class StepSix extends StatefulWidget {
  const StepSix({super.key});

  @override
  State<StepSix> createState() => _StepSixState();
}

class _StepSixState extends State<StepSix> {
  bool isFeet = true; // Default is feet
  double selectedHeightFeet = 5.0; // Default selected height in feet
  int selectedHeightCm = 152; // Default selected height in centimeters

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
              "Step 6 of 7",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "How tall are you?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 80),
            Center(
              child: ToggleButtons(
                isSelected: [isFeet, !isFeet],
                onPressed: (index) {
                  setState(() {
                    isFeet = index == 0;
                  });
                },
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
                selectedColor: Colors.white,
                fillColor: Colors.black,
                borderColor: Colors.black,
                selectedBorderColor: Colors.black,
                borderWidth: 2,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('FEET', style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('CM', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            isFeet ? _buildFeetSelector() : _buildCmSelector(),
            const SizedBox(height: 80),
            Center(
              child: isFeet
                  ? Text(
                      'Selected Height: ${selectedHeightFeet.toStringAsFixed(1)} feet',
                      style: const TextStyle(fontSize: 20),
                    )
                  : Text(
                      'Selected Height: $selectedHeightCm cm',
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
                      builder: (context) => const StepSeven(),
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

  Widget _buildFeetSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<int>(
          value: selectedHeightFeet.toInt(),
          onChanged: (value) {
            setState(() {
              selectedHeightFeet = value!.toDouble();
            });
          },
          items: List.generate(9, (index) {
            return DropdownMenuItem<int>(
              value: index + 1,
              child: Text('${index + 1} ft'),
            );
          }),
        ),
        const SizedBox(width: 20),
        DropdownButton<int>(
          value:
              ((selectedHeightFeet - selectedHeightFeet.toInt()) * 12).toInt(),
          onChanged: (value) {
            setState(() {
              selectedHeightFeet = selectedHeightFeet.toInt() + value! / 12;
            });
          },
          items: List.generate(12, (index) {
            return DropdownMenuItem<int>(
              value: index,
              child: Text('$index in'),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildCmSelector() {
    return Center(
      // Centering the DropdownButton
      child: DropdownButton<int>(
        value: selectedHeightCm,
        onChanged: (value) {
          setState(() {
            selectedHeightCm = value!;
          });
        },
        items: List.generate(200, (index) {
          return DropdownMenuItem<int>(
            value: index + 100,
            child: Text('${index + 100} cm'),
          );
        }),
      ),
    );
  }
}
