import 'package:flutter/material.dart';

import '../app_theme.dart';

Widget getTextField(BuildContext context, String hintText,
    {bool password = false,
    bool fillColor = false,
    TextEditingController textEditingController}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.08,
    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
    alignment: Alignment.center,
    child: TextField(
      controller: textEditingController == null
          ? TextEditingController()
          : textEditingController,
      obscureText: password,
      textAlign: TextAlign.left,
      cursorColor: Colors.grey,
      style: getTextStyleOf14Size(),
      decoration: InputDecoration(
        hintText: hintText,
        filled: fillColor,
        fillColor: _getFIllColor(fillColor),
      ),
    ),
  );
}

_getFIllColor(bool greyColor) {
  return greyColor ? Colors.grey[300] : Colors.transparent;
}
