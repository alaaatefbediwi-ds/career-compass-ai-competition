import 'package:flutter/material.dart';

import '../../../widgets/custom_password_strength.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/cutom_button.dart';


class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),

          CustomTextfield(
            title: "Password",
            controller: password,
            showPasswordToggle: true,
            titleColor: Colors.black,
          ),

          Padding(
            padding: const EdgeInsets.all(30),
            child: CustomPasswordStrength(controller: password),
          ),

          SizedBox(height: 60),

          Center(child: CustomButton(text: "Continue", onPressed: (){
            Navigator.pushReplacementNamed(context, '/successfulScreen');
          }))
        ],
      ),
    );
  }
}

