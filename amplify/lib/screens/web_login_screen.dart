import 'package:amplify/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebLogin extends BaseScreen {
  final String url;

  WebLogin(this.url);

  @override
  Widget buildUI(BuildContext context) {
    return WebView(
      initialUrl: url,
    );
  }

  @override
  void onBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
