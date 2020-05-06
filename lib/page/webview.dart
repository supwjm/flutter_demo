import 'package:flutter/material.dart';

class WebviewPage extends StatelessWidget {
  const WebviewPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('webview'),
      ),
      body: Text('webview'),
    );
  }
}
