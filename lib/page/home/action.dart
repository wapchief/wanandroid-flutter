import 'package:fish_redux/fish_redux.dart';
import 'package:wan_android/component/item/state.dart';
import 'package:wan_android/model/article_entity.dart';

import 'state.dart';

enum HomeAction { jumpDetail, loadData, getBanner, getArticle,getTopArticle }

class HomeActionCreator {


  //文章列表
  static Action onArticle(DatasEntity dataEntity) {
    return Action(HomeAction.getArticle, payload: dataEntity);
  }

  //加载更多
  static Action onLoadData(List<ItemState> list) {
//    return const Action(HomeAction.loadData,payload: list);
  }

//  static Action on

  //加载轮播
  static Action onGetBanner(List<BannerState> banners) {
    return Action(HomeAction.getBanner, payload: banners);
  }

  //置顶文章
  static Action onTopArticle(List<ArticleEntity> dataEntity){
    return Action(HomeAction.getTopArticle, payload: dataEntity);
  }
}