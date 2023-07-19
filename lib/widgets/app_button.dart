import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color foregroundColor;
  Color backgroundColor;
  final Color borderColor;
  final String text;
  final int borderRadius;
  final VoidCallback onPressed;
  IconData? icon;
  double width;
  double height;
  AppButtons(
      {super.key,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.width,
      required this.height,
      this.icon,
      required this.borderRadius,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        margin: EdgeInsets.all(5),
        // width: width,
        // height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius.toDouble()),
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            // minimumSize: Size.fromWidth(width).height(height),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: foregroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius.toDouble(),
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 0.04 * MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ),
    );
  }
}
