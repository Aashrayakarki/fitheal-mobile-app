import 'package:flutter/material.dart';

class SensorDashboardScreen extends StatefulWidget {
  const SensorDashboardScreen({super.key});

  @override
  State<SensorDashboardScreen> createState() => _SensorDashboardScreenState();
}

class _SensorDashboardScreenState extends State<SensorDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sensor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Accelerometer'),
                onPressed: () {
                  Navigator.pushNamed(context, '/accelerometerScreen');
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Gyroscope'),
                onPressed: () {
                  Navigator.pushNamed(context, '/gyroscopeScreen');
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Proximity'),
                onPressed: () {
                  Navigator.pushNamed(context, '/proximityScreen');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
