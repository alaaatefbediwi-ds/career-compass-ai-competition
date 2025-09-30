import 'package:flutter/material.dart';

import '../../../widgets/custom_textfield.dart';
import '../../../widgets/cutom_button.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignupScreen({super.key});

  void _signup(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // ✅ Only runs if valid
      Navigator.pushReplacementNamed(context, '/verifyEmailScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 60),
              CustomTextfield(
                controller: email,
                title: "Email",
                titleColor: Colors.black,
                hintText: "name@example",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "⚠️ Email cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Create an account",
                onPressed: () => _signup(context),
                fontSize: 16,
                horizontalPadding: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
