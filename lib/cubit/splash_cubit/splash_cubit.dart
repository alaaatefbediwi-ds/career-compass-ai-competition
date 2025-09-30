import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startSplash() async {
    // Wait 3 seconds then emit navigation state
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashFinished());
  }
}
