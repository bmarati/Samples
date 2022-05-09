import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          textStyle: getTextStyle(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        hintStyle: getTextStyleOf14Size(),
      ));
}

TextStyle getTextStyle() {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 18,
      color: Colors.grey,
    ),
  );
}

TextStyle getTextStyle18AndWhite() {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 18,
      color: Colors.white,
      letterSpacing: 2,
    ),
  );
}

TextStyle getTextStyleOf14Size() {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
  );
}

TextStyle getTextStyleOfBlack14Size() {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
  );
}

TextStyle getTextStyleOfRed12Size() {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 12,
      color: Colors.red,
    ),
  );
}

TextStyle getTextStyleOfGreen12Size() {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 12,
      color: Colors.green,
    ),
  );
}

TextStyle getTextStyleOf14SizeAndGold() {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 14,
        color: goldColor,
      ),
      fontWeight: FontWeight.bold);
}

Color goldColor = Color(0xfff2d493);
