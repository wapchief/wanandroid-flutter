import 'package:fish_redux/fish_redux.dart';
import 'package:wan_android/model/article_entity.dart';
import 'package:wan_android/model/result_entity.dart';
import 'package:wan_android/utils/network.dart';

import 'action.dart';
import 'state.dart';

//Effect 常用于定义 网络数据请求，或是界面点击事件等非数据操作
Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
//    HomeAction.loadData:
  });
}

//初始化数据
void _init(Action action, Context<HomeState> ctx) {
  _onGetBanner(action, ctx);
  _getHomeData(action, ctx);
}

//请求网络获取轮播资源
void _onGetBanner(Action action, Context<HomeState> ctx) async {
  print('_onGetBanner');
  ResultEntity entity = await NetUtils.get('/banner/json');
  print('_onGetBanner-ResultEntity:' + entity.data.toString());
  List<BannerState> list = new List<BannerState>();
  if (entity.errorCode == 0) {
    //请求成功
    (entity.data as List).forEach((v) {
      list.add(new BannerState.fromJson(v));
    });
  }
  ctx.dispatch(HomeActionCreator.onGetBanner(list));
}

//获取首页数据
void _getHomeData(Action action, Context<HomeState> ctx) async {
  ResultEntity entity = await NetUtils.get('/article/list/0/json');
//  List<ArticleEntity> list = new List();
  DatasEntity dataEntity = new DatasEntity();
  if (entity.errorCode == 0) {
    dataEntity = DatasEntity.fromJson(entity.data);
    print('_getHomeData:' + dataEntity.toString());
//    datasEntity.datas.forEach((v){
//      list.add(v);
//    });
  }
  ctx.dispatch(HomeActionCreator.onArticle(dataEntity));
}

void _onLoadData(Context<HomeState> ctx) {
  ctx.dispatch(HomeActionCreator.onLoadData(new List()));
}
