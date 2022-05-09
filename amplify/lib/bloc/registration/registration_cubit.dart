import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  String email;
  String gender;
  String training;
  String password;

  void saveEmail({String email, String gender, String training}) {
    this.email = email;
    this.gender = gender;
    this.training = training;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      emit(RegistratorValidEmail());
    } else {
      emit(RegistratorPassword());
    }
  }

  void savePassword({String password}) {
    this.password = password;
    emit(RegistratorDone());
  }

  void validatePassword(String password) {}

  void validatePasswords(String password, String confirmPassword) {
    RegExp numbers = RegExp("(.*[0-9].*)");
    RegExp lowerCaseChars = RegExp("(.*[a-z].*)");
    RegExp upperCaseChars = RegExp("(.*[A-Z].*)");

    if (lowerCaseChars.hasMatch(password)) {
      emit(PasswordHasLower());
    } else {
      emit(PasswordHasNoLower());
    }

    if (numbers.hasMatch(password)) {
      emit(PasswordHasDigit());
    } else {
      emit(PasswordHasNoDigit());
    }

    if (upperCaseChars.hasMatch(password)) {
      emit(PasswordHasUpper());
    } else {
      emit(PasswordHasNoUpper());
    }

    if (password != null && password.length >= 8) {
      emit(ValidPassword());
    } else {
      emit(InValidPassword());
    }
    if (password.isNotEmpty && password == confirmPassword) {
      emit(PasswordMatch());
    } else {
      emit(PasswordMismatch());
    }
  }
}
