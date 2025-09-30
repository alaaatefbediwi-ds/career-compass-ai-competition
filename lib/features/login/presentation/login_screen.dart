import 'package:careercompass/cubit/login_cubit/login_cubit.dart';
import 'package:careercompass/widgets/custom_textfield.dart';
import 'package:careercompass/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/homeView');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/job.png", width: 180),
              const SizedBox(height: 30),
              Text("Career Compass",
                  style: Theme.of(context).textTheme.headlineMedium),
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/images/green-rectangle.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Log in",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                                CustomTextfield(
                                  controller: email,
                                  title: "Email",
                                  hintText: "name@example",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "⚠️ Email cannot be empty";
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextfield(
                                  controller: password,
                                  title: "Password",
                                  hintText: "Enter password",
                                  showPasswordToggle: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "⚠️ Password cannot be empty";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                CustomButton(
                                  text: "Log in",
                                  onPressed: () => _login(context),
                                  color: Colors.white,
                                  textColor: const Color(0xff004030),
                                  fontSize: 16,
                                  horizontalPadding: 125,
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  child: Text("Forgot password?",
                                      style: Theme.of(context).textTheme.bodySmall),
                                ),
                                const SizedBox(height: 160),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don’t have an account? ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, '/signup');
                                      },
                                      child: Text("Sign up",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
