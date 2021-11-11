import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  static const tag = '/web-view';
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final link = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent,),
      body: WebView(
        initialUrl: link,
      ),
    );
  }
}
