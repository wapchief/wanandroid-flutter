import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'page/app.dart';
import 'utils/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //定时器
  Timer _timer;

  //上次点击时间
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          highlightColor: Colors.black87,
          splashColor: Colors.white70,
          accentColor: Colors.red,
        ),
        home: WillPopScope(
            child: AppPage(),
            onWillPop: () async {
              if (_lastPressedAt == null ||
                  DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
                //两次点击间隔超过1秒则重新计时
                _lastPressedAt = DateTime.now();
                ToastUtils.showShort('再按一次退出应用');
                return false;
              } else {
                exit(0);
                _timer.cancel();
                return true;
              }
            }));
  }
}
