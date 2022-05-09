part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginEmailInvalid extends LoginState {}

class LoginEmptyPassword extends LoginState {}

class LoginStart extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginTimer extends LoginState {
  final int timerValue;

  LoginTimer(this.timerValue);
}
