
import 'package:fish_redux/fish_redux.dart';

class ItemState implements Cloneable<ItemState>{

  String title;
  String subTitle;
  String id;
  String url;
  ItemState({this.title, this.subTitle,this.id,this.url});

  @override
  ItemState clone() {
    // TODO: implement clone
    return ItemState();
  }

}

ItemState initState(Map<String, dynamic> args) {
  return ItemState();
}
