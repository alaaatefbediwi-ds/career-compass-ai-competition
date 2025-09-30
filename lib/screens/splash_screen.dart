import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/splash_cubit/splash_cubit.dart';
import 'get_started_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..startSplash(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashFinished) {
            Navigator.pushReplacementNamed(context, '/get-started');
          }
        },
        child: const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Image(
              image: AssetImage('assets/images/job.png'),
              width: 250,
            ),
          ),
        ),
      ),
    );
  }
}
