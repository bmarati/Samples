import 'package:amplify/app_theme.dart';
import 'package:amplify/screens/base_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseScreen {
  @override
  Widget buildUI(BuildContext context) {
    return Center(
      child: Text(
        "HOME",
        style: getTextStyle18AndWhite(),
      ),
    );
  }

  @override
  void onBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
