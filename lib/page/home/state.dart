import 'package:fish_redux/fish_redux.dart';
import 'package:wan_android/component/item/state.dart';
import 'package:wan_android/model/article_entity.dart';

class HomeState implements Cloneable<HomeState> {
  List<BannerState> listBanner;
  List<ItemState> listArt;
  DatasEntity articleData;

//  ValueChanged<BannerState> onBanner;

  HomeState({this.listBanner, this.listArt});

  @override
  HomeState clone() {
    // TODO: implement clone
    return HomeState()
      ..listBanner = listBanner
      ..listArt = listArt
      ..articleData = articleData;

//      ..onBanner = onBanner;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}

//轮播
class BannerState implements Cloneable<BannerState> {
  String imagePath;
  int id;
  int isVisible;
  String title;
  int type;
  String url;
  String desc;
  int order;

  BannerState(
      {this.imagePath,
      this.id,
      this.isVisible,
      this.title,
      this.type,
      this.url,
      this.desc,
      this.order});

  BannerState.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    id = json['id'];
    isVisible = json['isVisible'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
    desc = json['desc'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['id'] = this.id;
    data['isVisible'] = this.isVisible;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    data['desc'] = this.desc;
    data['order'] = this.order;
    return data;
  }

  @override
  BannerState clone() {
    // TODO: implement clone
    return BannerState();
  }
}
