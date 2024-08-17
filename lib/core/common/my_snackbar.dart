import 'package:final_assignment/app/navigator_key/navigator_key.dart';
import 'package:flutter/material.dart';

void showMySnackBar({
  required String message,
  Color? color,
}) {
  final currentState = AppNavigator.navigatorKey.currentState;
  if (currentState != null) {
    ScaffoldMessenger.of(
      currentState.context,
    ).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? Colors.green,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  } else {
    // Handle the case when currentState is null
    debugPrint('Navigator key current state is null. Snackbar not shown.');
  }
}