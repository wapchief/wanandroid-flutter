import 'package:fish_redux/fish_redux.dart';
import 'package:wan_android/component/item/state.dart';

import 'state.dart';

enum HomeAction { jumpDetail,loadData,getBanner }

class HomeActionCreator {

  //查看详情
  static Action onJumpDetail() {
    return const Action(HomeAction.jumpDetail);
  }

  //加载更多
  static Action onLoadData(List<ItemState> list){
//    return const Action(HomeAction.loadData,payload: list);
  }

  //加载轮播
  static Action onGetBanner(List<BannerState> banners){
    return Action(HomeAction.getBanner,payload: banners);
  }
}