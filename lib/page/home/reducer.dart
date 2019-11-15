import 'package:fish_redux/fish_redux.dart';
import 'package:wan_android/component/item/state.dart';
import 'package:wan_android/model/article_entity.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.loadData: _onLoadData,
      HomeAction.getBanner: _getBanner,
      HomeAction.getArticle:_getArticle,
      HomeAction.getTopArticle:_getArticleTop,
    },
  );
}
HomeState _getArticleTop(HomeState state,Action action){
  final List<ArticleEntity> dataEntity = action.payload ?? [];
  final HomeState newState = state.clone();
  newState.articleTopData = dataEntity;
  return newState;
}

HomeState _getArticle(HomeState state,Action action){
  final DatasEntity dataEntity = action.payload ?? DatasEntity();
  final HomeState newState = state.clone();
  newState.articleData = dataEntity;
  return newState;
}


HomeState _getBanner(HomeState state, Action action) {
  final List<BannerState> toDos = action.payload ?? <BannerState>[];
  final HomeState newState = state.clone();
  newState.listBanner = toDos;
  return newState;
}

HomeState _onLoadData(HomeState state, Action action) {
  final List<ItemState> stateList = action.payload ?? <ItemState>[];
  final HomeState newState = state.clone();
  newState.listArt = stateList;
  return newState;
}