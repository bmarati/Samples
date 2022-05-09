import 'package:amplify/app_theme.dart';
import 'package:flutter/material.dart';

class PasswordCheck extends StatefulWidget {
  final bool valid;

  final String text;

  PasswordCheck(this.text, this.valid);
  @override
  _PasswordCheckState createState() => _PasswordCheckState();
}

class _PasswordCheckState extends State<PasswordCheck> {
  @override
  Widget build(BuildContext context) {
    return _buildWidget(widget.valid);
  }

  Widget _buildWidget(bool valid) {
    return Row(
      children: [
        valid ? _getRightTick() : _getWrongTick(),
        _getText(valid),
      ],
    );
  }

  Widget _getRightTick() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Icon(
        Icons.check,
        color: Colors.green,
        size: 14,
      ),
    );
  }

  Widget _getWrongTick() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Icon(
        Icons.clear,
        color: Colors.red,
        size: 14,
      ),
    );
  }

  Widget _getText(bool valid) {
    return Text(
      widget.text,
      style: valid ? getTextStyleOfGreen12Size() : getTextStyleOfRed12Size(),
    );
  }
}
