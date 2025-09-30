import 'package:flutter/material.dart';

import '../../../widgets/cutom_button.dart';


class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/accountCreated.png"),
          SizedBox(height: 20),
          Text("Your account was successfully created!" , style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),),
          SizedBox(height: 60),
          Center(child: CustomButton(text: "Log in", onPressed: (){
            Navigator.pushReplacementNamed(context, '/login');
          }))
        ],
      ),
    );
  }
}
