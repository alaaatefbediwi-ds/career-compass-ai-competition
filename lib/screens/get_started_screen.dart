import 'package:careercompass/widgets/cutom_button.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset("assets/images/job.png"),
            SizedBox(height: 50),
            Text(
              "Career Compass",
              style: TextTheme.of(context).headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Text(
                "Finding Your Perfect Career Path Started Here !",
                style: TextTheme.of(context).headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            CustomButton(text: "Get Started", onPressed: (){ Navigator.pushNamed(context, '/login');
            })
          ],
        ),
      ),
    );
  }
}
