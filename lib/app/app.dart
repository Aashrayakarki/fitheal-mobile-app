import 'package:final_assignment/app/navigator_key/navigator_key.dart';
import 'package:final_assignment/app/themes/app_theme.dart';
import 'package:final_assignment/features/sensors/accelerometer.dart';
import 'package:final_assignment/features/sensors/gyroscope.dart';
import 'package:final_assignment/features/sensors/proximity.dart';
import 'package:final_assignment/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Fit Heal',
      theme: AppTheme.getApplicationTheme(false),
      home: const SplashView(),
      routes: {
        '/proximityScreen': (BuildContext context) => const ProximityScreen(),
        '/gyroscopeScreen': (BuildContext context) => const GyroscopeScreen(),
        '/accelerometerScreen': (BuildContext context) =>
            const AccelerometerScreen(),
      },
    );
  }
}
