part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistratorPassword extends RegistrationState {}

class RegistratorEmail extends RegistrationState {}

class RegistratorValidEmail extends RegistrationState {}

class RegistratorDone extends RegistrationState {}

class PasswordHasSpecialChar extends RegistrationState {}

class PasswordHasNoSpecialChar extends RegistrationState {}

class PasswordHasLower extends RegistrationState {}

class PasswordHasNoLower extends RegistrationState {}

class PasswordHasUpper extends RegistrationState {}

class PasswordHasNoUpper extends RegistrationState {}

class PasswordHasDigit extends RegistrationState {}

class PasswordHasNoDigit extends RegistrationState {}

class ValidPassword extends RegistrationState {}

class InValidPassword extends RegistrationState {}

class PasswordMatch extends RegistrationState {}

class PasswordMismatch extends RegistrationState {}
