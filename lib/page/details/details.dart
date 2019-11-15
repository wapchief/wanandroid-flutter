import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:wan_android/utils/base.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  String url;
  String title;

  Details({this.url, this.title});

  @override
  Widget build(BuildContext context) {
//
//    final flutterWebviewPlugin = new FlutterWebviewPlugin();
////  flutterWebviewPlugin.launch(url)
//    flutterWebviewPlugin.onUrlChanged.listen((String url) {
//
//      print(url);
//    });
    // TODO: implement build
    return MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
          url: url,
//          appBar: BaseTheme.getAppBar(''),
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          debuggingEnabled: true,
        ),
      },
    );
  }
}
