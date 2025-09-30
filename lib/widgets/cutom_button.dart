import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final Color? color;
  final Color? textColor;
  final double horizontalPadding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = 24,
    this.color,
    this.textColor,
    this.horizontalPadding = 110,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? const Color(0xff004030),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: fontSize,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
