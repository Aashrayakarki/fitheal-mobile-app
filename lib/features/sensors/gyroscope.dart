 import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';
 
class GyroscopeScreen extends StatefulWidget {
  const GyroscopeScreen({super.key});
 
  @override
  State<GyroscopeScreen> createState() => _GyroscopeScreenState();
}
 
class _GyroscopeScreenState extends State<GyroscopeScreen> {
  List<double> _gyroscopeValues = [];
 
  @override
  void initState() {
    super.initState();
    gyroscopeEvents!.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = [event.x, event.y, event.z];
      });
    });
  }
 
  @override
  Widget build(BuildContext context) {
    final List<String> gyroscope =
        _gyroscopeValues.map((double v) => v.toStringAsFixed(1)).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyroscope'),
      ),
      body: Center(
        child: Text(
          'Gyroscope values:\n\nX: ${gyroscope[0]}, Y: ${gyroscope[1]}, Z: ${gyroscope[2]}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
 