import 'package:wan_android/model/result_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    }  else if (T.toString() == "ResultEntity") {
      return ResultEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}