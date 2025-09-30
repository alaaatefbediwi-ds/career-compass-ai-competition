import 'package:flutter/material.dart';

class CustomPasswordStrength extends StatefulWidget {
  final TextEditingController controller;

  const CustomPasswordStrength({super.key, required this.controller});

  @override
  State<CustomPasswordStrength> createState() => _CustomPasswordStrengthState();
}

class _CustomPasswordStrengthState extends State<CustomPasswordStrength> {
  double strength = 0;

  double _calculateStrength(String value) {
    double s = 0;
    if (value.length >= 8) s += 0.33;
    if (RegExp(r'[0-9]').hasMatch(value)) s += 0.33;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) s += 0.34;
    return s.clamp(0, 1);
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        strength = _calculateStrength(widget.controller.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.controller.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Progress bar
        LinearProgressIndicator(
          value: strength,
          minHeight: 6,
          backgroundColor: Colors.grey[300],
          color: strength <= 0.33
              ? Colors.red
              : strength <= 0.66
              ? Colors.orange
              : Colors.green,
        ),
        const SizedBox(height: 20),

        // ✅ Rules
        _buildRule(
          condition: text.length >= 8,
          label: "8 characters minimum",
        ),
        _buildRule(
          condition: RegExp(r'[0-9]').hasMatch(text),
          label: "a number",
        ),
        _buildRule(
          condition: RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(text),
          label: "a symbol",
        ),
      ],
    );
  }

  Widget _buildRule({required bool condition, required String label}) {
    return Row(
      children: [
        Icon(
          condition ? Icons.check_circle : Icons.radio_button_unchecked,
          color: condition ? Colors.green : Colors.grey,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(label , style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),),
      ],
    );
  }
}
