import 'package:amplify/app_theme.dart';
import 'package:amplify/bloc/registration/registration_cubit.dart';
import 'package:amplify/screens/login_screen.dart';
import 'package:amplify/widgets/password_check_widget.dart';
import 'package:amplify/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationState currentState = RegistrationInitial();
  String selectedValue;
  TextEditingController emailontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool _passwordLengthMatch = false;
  bool _passwordHasDigits = false;
  bool _passwordHasLower = false;
  bool _passwordHasUpper = false;
  bool _passwordMatch = false;

  @override
  void initState() {
    super.initState();
    _registerDependencies();
    passwordController.addListener(() => _validatePasswords());
    confirmController.addListener(() => _validatePasswords());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationCubit, RegistrationState>(
      bloc: GetIt.I.get<RegistrationCubit>(),
      listener: (context, state) {
        switch (state.runtimeType) {
          case RegistratorValidEmail:
            _showError(context, "Invalid email");
            break;
          case ValidPassword:
            setState(() {
              _passwordLengthMatch = true;
            });
            break;
          case InValidPassword:
            setState(() {
              _passwordLengthMatch = false;
            });
            break;
          case PasswordHasDigit:
            setState(() {
              _passwordHasDigits = true;
            });
            break;
          case PasswordHasNoDigit:
            setState(() {
              _passwordHasDigits = false;
            });
            break;
          case PasswordHasLower:
            setState(() {
              _passwordHasLower = true;
            });
            break;
          case PasswordHasNoLower:
            setState(() {
              _passwordHasLower = false;
            });
            break;

          case PasswordHasUpper:
            setState(() {
              _passwordHasUpper = true;
            });
            break;
          case PasswordHasNoUpper:
            setState(() {
              _passwordHasUpper = false;
            });
            break;
          case PasswordMatch:
            setState(() {
              _passwordMatch = true;
            });
            break;
          case PasswordMismatch:
            setState(() {
              _passwordMatch = false;
            });
            break;
          case RegistratorPassword:
            setState(() {
              currentState = RegistratorPassword();
            });
            return _getPasswordWidget();

          default:
            return _getInitialUI();
        }
      },
      child: _getInitialUI(),
    );
  }

  Widget _getInitialUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            AppLocalizations.of(context).signUp.toUpperCase(),
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 30,
                color: goldColor,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 10, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: _getDivider(),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: GetIt.I.get<RegistrationCubit>().state.runtimeType ==
                          RegistrationInitial
                      ? _getEmptyDivider()
                      : _getDivider()),
            ],
          ),
        ),
        GetIt.I.get<RegistrationCubit>().state.runtimeType ==
                RegistrationInitial
            ? _getEmailWidget()
            : _getPasswordWidget()
      ],
    );
  }

  Widget _getDivider() {
    return Divider(
      thickness: 3,
      color: goldColor,
    );
  }

  Widget _getEmptyDivider() {
    return Divider(
      thickness: 3,
      color: Colors.grey,
    );
  }

  Widget _getEmailWidget() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context).whatsUrEmail,
                style: getTextStyleOfBlack14Size(),
              ),
              getTextField(context, AppLocalizations.of(context).email,
                  fillColor: true, textEditingController: emailontroller),
              Text(
                AppLocalizations.of(context).genderQuestion,
                style: getTextStyleOfBlack14Size(),
              ),
              RadioGroup(),
              Text(
                AppLocalizations.of(context).userNameEmail,
                style: getTextStyleOfBlack14Size(),
              ),
              _dropDownWidget(),
              Expanded(
                flex: 1,
                child: Container(),
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
                        .get<RegistrationCubit>()
                        .saveEmail(email: emailontroller.text)
                  },
                  child: Text(
                    AppLocalizations.of(context).next,
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPasswordWidget() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context).choosePassword,
                style: getTextStyleOfBlack14Size(),
              ),
              getTextField(context, AppLocalizations.of(context).password,
                  fillColor: true, textEditingController: passwordController),
              getTextField(context, AppLocalizations.of(context).cofirmPassword,
                  fillColor: true, textEditingController: confirmController),
              PasswordCheck(AppLocalizations.of(context).passwordValid1,
                  _passwordLengthMatch),
              PasswordCheck(AppLocalizations.of(context).passwordValid2,
                  _passwordHasUpper),
              PasswordCheck(AppLocalizations.of(context).passwordValid3,
                  _passwordHasLower),
              PasswordCheck(AppLocalizations.of(context).passwordValid4,
                  _passwordHasDigits),
              PasswordCheck(
                  AppLocalizations.of(context).passwordValid5, _passwordMatch),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: goldColor,
                  ),
                  onPressed: () => {_onContinue()},
                  child: Text(
                    AppLocalizations.of(context).continueText,
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDownWidget() {
    selectedValue = selectedValue ?? AppLocalizations.of(context).trainMsg1;
    return InputDecorator(
      decoration: InputDecoration(
        labelStyle: Theme.of(context)
            .primaryTextTheme
            .caption
            .copyWith(color: Colors.black),
        border: const OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          value: selectedValue,
          isDense: true,
          items: <String>[
            AppLocalizations.of(context).trainMsg1,
            AppLocalizations.of(context).trainMsg2,
            AppLocalizations.of(context).trainMsg3,
            AppLocalizations.of(context).trainMsg4,
          ].map((String item) {
            return new DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: getTextStyleOf14Size(),
              ),
            );
          }).toList(),
          onChanged: (selectedItem) =>
              setState(() => selectedValue = selectedItem),
        ),
      ),
    );
  }

  _validatePasswords() {
    GetIt.I
        .get<RegistrationCubit>()
        .validatePasswords(passwordController.text, confirmController.text);
  }

  void _registerDependencies() {
    if (!GetIt.I.isRegistered<RegistrationCubit>()) {
      GetIt.I
          .registerLazySingleton<RegistrationCubit>(() => RegistrationCubit());
    }
  }

  void _onContinue() {
    if (_passwordHasDigits &&
        _passwordHasLower &&
        _passwordHasUpper &&
        _passwordLengthMatch &&
        _passwordMatch) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ),
        (route) => false,
      );
    }
  }
}

void _showError(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class RadioGroup extends StatefulWidget {
  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  int _radioValue = 0;
  @override
  Widget build(BuildContext context) {
    List values = [
      AppLocalizations.of(context).male,
      AppLocalizations.of(context).female,
      AppLocalizations.of(context).na,
    ];

    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Text(
          values[0],
          style: getTextStyleOfBlack14Size(),
        ),
        new Radio(
          value: 0,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        ),
        new Text(
          values[1],
          style: getTextStyleOfBlack14Size(),
        ),
        new Radio(
          value: 1,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        ),
        new Text(
          values[2],
          style: getTextStyleOfBlack14Size(),
        ),
        new Radio(
          value: 2,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        ),
      ],
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }
}
