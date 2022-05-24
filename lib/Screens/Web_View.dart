import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
class Web_View extends StatelessWidget {

  final url;
  Web_View({
     this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewPlus(initialUrl: url),
    );
  }
}
