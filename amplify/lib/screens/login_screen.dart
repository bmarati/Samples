import 'package:amplify/bloc/login/login_cubit.dart';
import 'package:amplify/screens/base_screen.dart';
import 'package:amplify/screens/home_screen.dart';
import 'package:amplify/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../app_theme.dart';
import '../bloc/registration/registration_cubit.dart';
import 'create_account_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class LoginScreen extends BaseScreen {
  TextEditingController userNameControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  AlertDialog alertDialog;

  LoginScreen() {
    _registerDependencies();
  }
  @override
  Widget buildUI(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: GetIt.I.get<LoginCubit>(),
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginEmailInvalid:
            _showError(context, "Invalid email");
            break;

          case LoginEmptyPassword:
            _showError(context, "Enter password");
            break;
          case LoginStart:
            _buildAlert(context);
            showDialog(
              context: context,
              builder: (_) => alertDialog,
              barrierDismissible: false,
            );

            break;
          case LoginSuccess:
            Navigator.of(context).pop(alertDialog);
            _navigate(context, HomeScreen());
            break;
        }
      },
      child: _buildInitUI(context),
    );
  }

  void _registerDependencies() {
    if (!GetIt.I.isRegistered<LoginCubit>()) {
      GetIt.I.registerSingleton<LoginCubit>(LoginCubit());
    }
  }

  void _showError(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _buildAlert(BuildContext context) {
    alertDialog = AlertDialog(
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
            ),
            child: CircularProgressIndicator(),
          ),
          Text(
            AppLocalizations.of(context).loadingText,
          ),
          TimerView(),
        ],
      ),
    );
  }

  Widget _buildInitUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/logo_login.jpg'),
          height: 150,
          width: 250,
        ),
        getTextField(
          context,
          AppLocalizations.of(context).userNameEmail,
          textEditingController: userNameControl,
        ),
        getTextField(
          context,
          AppLocalizations.of(context).password,
          password: true,
          textEditingController: passwordControl,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
            child: Text(
              AppLocalizations.of(context).forgetPassword,
              style: getTextStyleOf14SizeAndGold(),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.05,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: goldColor,
            ),
            onPressed: () => {
              GetIt.I
                  .get<LoginCubit>()
                  .login(userNameControl.text, passwordControl.text)
            },
            child: Text(
              AppLocalizations.of(context).logIn,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/facebook.png'),
                  height: 30,
                  width: 30,
                ),
              ),
              Text(
                AppLocalizations.of(context).continueFacebbok,
                style: getTextStyle(),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => {},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/google.png'),
                    height: 30,
                    width: 30,
                  ),
                ),
                Text(
                  AppLocalizations.of(context).continueGoogle,
                  style: getTextStyle(),
                ),
              ],
            ),
          ),
        ),
        Divider(
          endIndent: 20,
          indent: 20,
          color: Colors.grey,
        ),
        GestureDetector(
          onTap: () => _navigate(context, SignUpScreen()),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppLocalizations.of(context).dontHaveAccount,
                ),
                TextSpan(
                    text: AppLocalizations.of(context).signUp,
                    style: getTextStyleOf14SizeAndGold())
              ],
            ),
          ),
        ),
      ],
    );
  }

  _navigate(BuildContext context, Object object) {
    Navigator.of(context).push(_createRoute(object));
  }

  Route _createRoute(Object object) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => object,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class TimerView extends StatefulWidget {
  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  int value = 5;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: GetIt.I.get<LoginCubit>(),
      listener: (context, state) {
        if (state.runtimeType == LoginTimer) {
          setState(() {
            value = (state as LoginTimer).timerValue;
          });
        }
      },
      child: Text(" $value ..."),
    );
  }
}
