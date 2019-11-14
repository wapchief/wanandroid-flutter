import 'package:fish_redux/fish_redux.dart';
import 'package:wan_android/component/item/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.loadData: _onLoadData,
      HomeAction.getBanner: _getBanner,
    },
  );
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