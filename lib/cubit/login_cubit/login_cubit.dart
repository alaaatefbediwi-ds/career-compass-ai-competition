import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<bool> {
  LoginCubit() : super(false); // false = not loading

  Future<void> login() async {
    emit(true); // show loading
    await Future.delayed(const Duration(seconds: 2)); // simulate API call
    emit(false); // hide loading
  }
}