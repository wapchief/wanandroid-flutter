import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wan_android/model/result_entity.dart';
import 'package:wan_android/utils/sp.dart';

const BASE_URL = 'https://www.wanandroid.com';

class NetUtils {
  static Future get(String url, {Map<String, dynamic> params}) async {
    String userName = await SPUtils.getUserName();
    String password = await SPUtils.getPassword();
    List<Cookie> cookies = new List();
    if (userName != null && userName != '' && password != null && password != '') {
      cookies.add(Cookie('username', userName));
      cookies.add(Cookie('password', password));
    }
    //header配置
    BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 60000,
      headers: {
        'Content-Type': 'application/json',
      },
      cookies: cookies,
    );
    var dio = new Dio(options);
    ResultEntity entity = new ResultEntity();
    var response;
    try {
      if (params != null) {
        response = await dio.get(url, queryParameters: params);
      } else {
        response = await dio.get(url);
      }
      print(response);
      var result = jsonDecode(response.toString());
      entity = ResultEntity.fromJson(result);
      return entity;
    } on DioError catch (e) {
      entity.errorMsg = e.response.toString();
      entity.errorCode = 1;
      print(e.toString());
      return entity;
    }
  }

  /*
   * error统一处理
   */
  static void formatError(DioError e) {
    print('error:' + e.response.toString());
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}
