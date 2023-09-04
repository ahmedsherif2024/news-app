// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebView extends StatelessWidget {
  const WebView({super.key, required this.blogUrl});
  final String blogUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter News",
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: WebViewPlus(
        initialUrl: blogUrl,

      ),

    );
  }
}