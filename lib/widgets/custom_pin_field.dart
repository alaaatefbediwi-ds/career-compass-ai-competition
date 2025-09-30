import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinField extends StatelessWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;

  const CustomPinField({
    super.key,
    this.onChanged,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 5,
      keyboardType: TextInputType.number,
      textStyle: const TextStyle(color: Colors.black),
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 50,
        fieldWidth: 66,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        activeColor: Colors.grey,
        inactiveColor: Colors.grey,
        selectedColor: const Color(0xff154D71),
        activeBoxShadow: [
          BoxShadow(
            color: Color(0xff6400CD1F),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      enableActiveFill: true,
      onChanged: onChanged ?? (value) {},
      onCompleted: onCompleted ?? (value) {},
    );
  }
}
