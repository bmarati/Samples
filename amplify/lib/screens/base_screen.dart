import 'package:flutter/material.dart';

abstract class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => onBack(context),
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: buildUI(context),
        ),
      ),
    );
  }

  Widget buildUI(BuildContext context);

  void onBack(BuildContext context) {}
}
