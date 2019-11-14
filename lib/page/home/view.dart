import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wan_android/page/home/state.dart';
import 'package:wan_android/utils/base.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService service) {
//  final adapter = service.buildAdapter();
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Container(
          child: (state.listBanner == null || state.listBanner.length == 0)
              ? Center(
                  child: Text(state.listBanner == null ? '加载中...' : '暂无内容'),
                )
              : Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      state.listBanner[index].imagePath,
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: state.listBanner == null ? 0 : state.listBanner.length,
                  pagination: new SwiperPagination(),
                  control: new SwiperControl(),
                ),
          height: 200.0,
        ),

      ],
    ),
  );
}
