import 'package:amplify/screens/base_screen.dart';
import 'package:amplify/screens/email_reg_screen.dart';
import 'package:amplify/screens/web_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:amplify/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends BaseScreen {
  Widget buildUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/logo_login.jpg'),
          height: 150,
          width: 250,
        ),
        Text(
          AppLocalizations.of(context).gain,
          style: getTextStyle18AndWhite(),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
              ),
              onPressed: () =>
                  {buildFacebookLogin(context, "https://www.facebook.com/")},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image(
                      image: AssetImage('assets/facebook.png'),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).signUpFacebbok,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () =>
                  {buildFacebookLogin(context, "https://accounts.google.com/")},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image(
                      image: AssetImage('assets/google.png'),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).signUpGoogle,
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 50),
            child: GestureDetector(
              onTap: () => _navigateToRegScreen(context),
              child: Text(
                AppLocalizations.of(context).signUpEmail,
                style: getTextStyleOf14SizeAndGold(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Divider(
          endIndent: 20,
          indent: 20,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: () => onBack(context),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: AppLocalizations.of(context).haveAccount),
                  TextSpan(
                      text: AppLocalizations.of(context).signIn,
                      style: getTextStyleOf14SizeAndGold())
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  _navigateToRegScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailRegScreen(),
      ),
    );
  }

  buildFacebookLogin(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebLogin(url),
      ),
    );
  }
}
