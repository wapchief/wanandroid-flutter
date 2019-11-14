import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
/**
 * @author wapchief
 * @date 2019-06-18
 */
class ToastUtils {
  static showLong(String str) async {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        textColor: Color(0xff22242a),
        backgroundColor: Color(0xfff1f3f8));
  }

  static showShort(String str) async {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: Color(0xff22242a),
        backgroundColor: Color(0xfff1f3f8));
  }
}
