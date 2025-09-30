import 'package:careercompass/features/home/presentation/home_view.dart';
import 'package:careercompass/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:careercompass/features/signup/presentation/set_password_screen.dart';
import 'package:careercompass/features/signup/presentation/successful_screen.dart';
import 'package:careercompass/features/signup/presentation/verify_email_screen.dart';
import 'package:careercompass/features/top_jobs/presentation/top_jobs_view.dart';
import 'package:careercompass/screens/get_started_screen.dart';
import 'package:careercompass/features/login/presentation/login_screen.dart';
import 'package:careercompass/features/signup/presentation/signup_screen.dart';
import 'package:careercompass/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/login_cubit/login_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/get-started': (context) => const GetStartedScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/verifyEmailScreen': (context) => VerifyEmailScreen(),
        '/setPasswordScreen': (context) => SetPasswordScreen(),
        '/successfulScreen': (context) => SuccessfulScreen(),
        '/homeView': (context) => HomeView(),
        '/top_jobs': (context) => TopJobsView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontFamily: "Inter",
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            headlineMedium: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            displayLarge: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white),
            bodyMedium: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
            bodySmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
    );
  }
}
