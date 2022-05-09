import 'package:amplify/bloc/registration/registration_cubit.dart';
import 'package:amplify/screens/base_screen.dart';
import 'package:amplify/screens/registarion_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EmailRegScreen extends BaseScreen {
  @override
  Widget buildUI(BuildContext context) {
    return RegistrationScreen();
  }

  @override
  void onBack(BuildContext context) {
    Navigator.of(context).pop();
    GetIt.I.unregister<RegistrationCubit>();
  }
}
