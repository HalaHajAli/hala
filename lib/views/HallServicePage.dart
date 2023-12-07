import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArWebView extends StatelessWidget {
  final String arUrl;

  ArWebView({required this.arUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Experience'),
      ),
      body: WebView(
        initialUrl: arUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
