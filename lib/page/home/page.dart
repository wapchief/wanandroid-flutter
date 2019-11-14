
import 'package:fish_redux/fish_redux.dart';
import 'package:wan_android/page/home/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class HomePage extends Page<HomeState,Map<String,dynamic>>{
  HomePage():
        super(
        initState: initState,
        effect: buildEffect(),
        reducer: buildReducer(),
        view: buildView,
        middleware: <Middleware<HomeState>>[],
      );
}