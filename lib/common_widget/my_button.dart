import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final String? iconAsset; // Asset path for the icon
  final double iconSize; // Size of the icon
  final double spacing; // Spacing between the icon and text
  final double borderRadius;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.iconAsset, // Asset path for the icon
    this.iconSize = 24.0, // Default size of the icon
    this.spacing = 18.0, // Default spacing between the icon and text
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        child: Stack(
          alignment: Alignment.centerLeft, // Align the icon to the left
          children: [
            if (iconAsset != null) // Conditionally display the icon
              Positioned(
                left: spacing, // Set left position to create spacing
                child: Image.asset(
                  iconAsset!,
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
