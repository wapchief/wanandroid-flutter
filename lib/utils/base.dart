import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BaseTheme {
  //通用的Appbar
  static getAppBar(String text) {
    return AppBar(
      title: Text(
        text,
        style: TextStyle(color: Color(BASE_TEXT), fontSize: 19.0),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }

  //主题色
  static const BASE_COLOR = 0xff5d93fa;

  //黑色字体
  static const BASE_TEXT = 0xff22242a;

  //底部分割线
  static const BOX_DECORATION_DIVIDER = BoxDecoration(
      color: Colors.white, border: Border(bottom: BorderSide(color: Color(0xfff1f3f8))));

  //顶部分割线
  static const BOX_DECORATION_DIVIDER_TOP =
      BoxDecoration(border: Border(top: BorderSide(color: Color(0xfff1f3f8))));

  //主题字体风格
  static const STYLE_TEXT_14 = TextStyle(
      color: Color(BaseTheme.BASE_TEXT),
      fontSize: 14.0,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);
  static const STYLE_TEXT_13 = TextStyle(
      color: Color(BaseTheme.BASE_TEXT),
      fontSize: 13.0,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);
  static const STYLE_TEXT_12 = TextStyle(
      color: Color(BaseTheme.BASE_TEXT),
      fontSize: 12.0,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);
  static const STYLE_TEXT_15 = TextStyle(
      color: Color(BaseTheme.BASE_TEXT),
      fontSize: 15.0,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);
  static const STYLE_TEXT_16 = TextStyle(
      color: Color(BaseTheme.BASE_TEXT),
      fontSize: 16.0,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);
  static const STYLE_TEXT_15_WEIGHT = TextStyle(
      color: Color(BaseTheme.BASE_TEXT),
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static const STYLE_TEXT_14_WEIGHT = TextStyle(
      color: Color(BaseTheme.BASE_TEXT),
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  static const STYLE_TEXT_16_WEIGHT = TextStyle(
      color: Color(BaseTheme.BASE_TEXT),
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  //评论，或文章内容字体样式
  static const STYLE_TEXT_SUMMARY_12 = TextStyle(
    color: Color(0xff5b6067),
    fontSize: 12,
    height: 1.4,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
  );
  static const STYLE_TEXT_SUMMARY_14 = TextStyle(
      color: Color(0xff5b6067),
      fontSize: 14,
      height: 1.4,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);
  static const STYLE_TEXT_SUMMARY_16 = TextStyle(
      color: Color(0xff5b6067),
      fontSize: 16,
      height: 1.4,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);
  static const STYLE_TEXT_SUMMARY_15 = TextStyle(
      color: Color(0xff5b6067),
      fontSize: 15,
      height: 1.4,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);

  //提示hint文字样式
  static const STYLE_TEXT_HINT_14 = TextStyle(color: Color(0xffCDCDD7), fontSize: 14.0);
  static const STYLE_TEXT_HINT_13 = TextStyle(color: Color(0xffCDCDD7), fontSize: 13.0);
  static const STYLE_TEXT_HINT_12 = TextStyle(color: Color(0xffCDCDD7), fontSize: 12.0);

  //灰色文字
  static const STYLE_TEXT_GRAY_12 = TextStyle(
      color: Color(0xff8D92A3),
      fontSize: 12.0,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);
  static const STYLE_TEXT_GRAY_13 = TextStyle(
      color: Color(0xff8D92A3),
      fontSize: 13.0,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);
  static const STYLE_TEXT_GRAY_14 = TextStyle(
      color: Color(0xff8D92A3),
      fontSize: 14.0,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);

  //白色文字
  static const STYLE_TEXT_WHITE_12 = TextStyle(color: Colors.white, fontSize: 12.0);
  static const STYLE_TEXT_WHITE_13 = TextStyle(color: Colors.white, fontSize: 13.0);

  // 下拉刷新样式
  static Header baseRefreshHeader() {
    Header header = MaterialHeader();
    return header;
  }

  //自定义加载更多样式
  static Footer baseRefreshFooter([String noMoreStr]) {
    Footer footer = CustomFooter(
        enableInfiniteLoad: true,
        extent: 40.0,
        triggerDistance: 50.0,
        footerBuilder: (context,
            loadState,
            pulledExtent,
            loadTriggerPullDistance,
            loadIndicatorExtent,
            axisDirection,
            float,
            completeDuration,
            enableInfiniteLoad,
            success,
            noMore) {
          if (noMore)
            return Container(
              child: Center(
                child: Text(
                  noMoreStr == null ? '到底了~' : noMoreStr,
                  style: BaseTheme.STYLE_TEXT_GRAY_13,
                ),
              ),
            );
          return Stack(
            children: <Widget>[
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  child: SpinKitCircle(
                    color: Color(BASE_COLOR),
                    size: 30.0,
                  ),
                ),
              ),
            ],
          );
        });
    return footer;
  }
}
