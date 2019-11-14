import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/utils/base.dart';

import 'home/page.dart';

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage> with AutomaticKeepAliveClientMixin {
  String appBarTitle = tabData[0]['text'];

//  List<Widget> list = [Ai(),Message(),Works()];
  int _currentIndex = 0;

  @override
  bool get wantKeepAlive {
    return true;
  }

  final AbstractRoutes routes = PageRoutes(

    pages: <String, Page<Object, dynamic>>{
      /// 注册主页面
      'home': HomePage(),

    },
  );


  static List tabData = [
    {
      'text': 'WanAndroid-flutter',
      'icon': Icon(Icons.home,color: Color(BaseTheme.BASE_COLOR),),
      'activeIcon': Icon(Icons.home,color: Color(0xffCDCDD7),),
    },
    {
      'text': '记录',
      'icon': Icon(Icons.school,color: Color(BaseTheme.BASE_COLOR)),
      'activeIcon': Icon(Icons.school,color: Color(0xffCDCDD7),),
    },
    {
      'text': '我的',
      'icon': Icon(Icons.person,color: Color(BaseTheme.BASE_COLOR)),
      'activeIcon': Icon(Icons.person,color: Color(0xffCDCDD7),),
    }
  ];
  List<BottomNavigationBarItem> myTabs = [];

  void _ItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['activeIcon'],
        title: Text(
          tabData[i]['text'],
        ),
        activeIcon: tabData[i]['icon'],
        backgroundColor: Colors.white,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tabData[_currentIndex]['text'],
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xff5d93fa),
      ),
      body: IndexedStack(
        children: <Widget>[
          routes.buildPage('home', null),
//          routes.buildPage('home', null),
//          routes.buildPage('home', null)
//          Container(),
          Container(),
          Container(),
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _ItemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        fixedColor: Color(BaseTheme.BASE_COLOR),
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        iconSize: 27.0,
        unselectedItemColor: Color(0xFF22242A),
      ),
    );
  }

}



