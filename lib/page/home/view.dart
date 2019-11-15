import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wan_android/page/details/details.dart';
import 'package:wan_android/page/home/state.dart';
import 'package:wan_android/utils/base.dart';

import 'action.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService service) {
//  final adapter = service.buildAdapter();
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        //轮播
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
                  onTap: (i) {
                    //进详情
//                    HomeActionCreator.onJumpDetail(state.listBanner[i]);
                    Navigator.push<String>(service.context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Details(url: state.listBanner[i].url);
                    })).then((String res) {});
                  },
                  autoplay: true,
                  itemCount: state.listBanner == null ? 0 : state.listBanner.length,
                  pagination: new SwiperPagination(),
                  control: new SwiperControl(),
                ),
          height: 200.0,
        ),
        state.articleTopData == null || state.articleTopData.length == 0
            ? Container()
            : Container(
                height: 50.0,
                color: Colors.white,
                margin: EdgeInsets.only(right: 10.0),
                child: Swiper(
                  itemCount: state.articleTopData.length,
                  index: 0,
                  autoplayDelay: 4000,
                  autoplay: true,
                  duration: 1500,
                  scrollDirection: Axis.vertical,
                  onTap: (int i) {
                    Navigator.push<String>(service.context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Details(url: state.articleTopData[i].link);
                    })).then((String res) {});
                  },
                  itemBuilder: (context, i) {
                    return Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                          margin: EdgeInsets.only(left: 20.0,right: 10.0),
                          child: Text(
                            '置顶',
                            style: TextStyle(color: Colors.white,fontSize: 12.0),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            color: Colors.redAccent
                          ),
                        ),
                        Expanded(
                            child: Text(
                          state.articleTopData[i].title,
//                          maxLines: 1,
//                          overflow: TextOverflow.ellipsis,
                          style: BaseTheme.STYLE_TEXT_14,
                        )),
                      ],
                    );
                  },
                ),
              ),
        //文章
        state.articleData == null ||
                state.articleData.datas == null ||
                state.articleData.datas.length == 0
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemCount: state.articleData.datas.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BaseTheme.BOX_DECORATION_DIVIDER,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  state.articleData.datas[index].title,
                                  style: BaseTheme.STYLE_TEXT_15_WEIGHT,
                                ),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.favorite,
                                  color: state.articleData.datas[index].collect
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                state.articleData.datas[index].author == ''
                                    ? '分享人：' + state.articleData.datas[index].shareUser
                                    : '作者：' + state.articleData.datas[index].author,
                                style: BaseTheme.STYLE_TEXT_SUMMARY_12,
                              ),
                              Text(
                                state.articleData.datas[index].chapterName +
                                    '/' +
                                    state.articleData.datas[index].superChapterName +
                                    '   ' +
                                    state.articleData.datas[index].niceDate,
                                style: BaseTheme.STYLE_TEXT_SUMMARY_12,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push<String>(service.context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Details(url: state.articleData.datas[index].link);
                      })).then((String res) {});
                    },
                  );
                })
      ],
    ),
  );
}
