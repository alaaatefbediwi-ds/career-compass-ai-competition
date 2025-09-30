import 'package:flutter/material.dart';

import '../../../widgets/custom_pin_field.dart';
import '../../../widgets/cutom_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "We just sent 5-digit code to person@gmail.com, enter it below:",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Text("Code",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.black)),
              const SizedBox(height: 10),
              CustomPinField(
                onChanged: (value) {
                  print(value);
                },
                onCompleted: (value) {
                  print("Code completed: $value");
                },
              ),
              SizedBox(height: 30),
              CustomButton(text: "Verify Email", onPressed: () {
                Navigator.pushReplacementNamed(context, '/setPasswordScreen');
              }),
              SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  child: Text("Resend Code",
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
