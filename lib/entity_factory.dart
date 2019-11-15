import 'package:wan_android/model/article_entity.dart';
import 'package:wan_android/model/result_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ResultEntity") {
      return ResultEntity.fromJson(json) as T;
    } else if (T.toString() == "ArticleEntity") {
      return ArticleEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}