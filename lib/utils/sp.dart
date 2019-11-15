import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  //获取本地存储的用户ID
  static Future<dynamic> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('user_id');
  }

  //获取用户头像
  static Future<dynamic> getUserAvatar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('avatar');
  }

  //获取用户名
  static Future<dynamic> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('userName');
  }

  //获取密码
  static Future<dynamic> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('passWord');
  }

  //保存用户资料
  static Future<dynamic> setUserInfo(
      {String token,
      int userId,
      String userName,
      String avatar,
      String password,
      String phoneNumber}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (userName != null) {
        prefs.setString('userName', userName);
      }
      if (avatar != null) {
        prefs.setString('avatar', avatar);
      }
      //是否认证
      if (password != null) {
        prefs.setString('passWord', password);
      }

      if (phoneNumber != null) {
        prefs.setString('user_phone', phoneNumber);
      }
      return '1';
    } catch (e) {
      return '0';
    }
  }
}
