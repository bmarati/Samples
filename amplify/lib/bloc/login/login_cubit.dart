import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  login(String userName, String password) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(userName);
    if (!emailValid) {
      emit(LoginEmailInvalid());
    } else if (password.isEmpty) {
      emit(LoginEmptyPassword());
    } else {
      emit(LoginStart());
      int value = 4;
      var timer = Timer.periodic(Duration(seconds: 1), (timer) {
        emit(LoginTimer(value--));
      });
      Future.delayed(Duration(seconds: 5), () {
        emit(LoginSuccess());
        timer.cancel();
      });
    }
  }
}
