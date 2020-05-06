import 'dart:developer';

import 'package:flutter/material.dart';
import './index.dart';
import './page/login.dart';
import './page/gesture.dart';
import './page/fetchData.dart';
import './page/dialog.dart';
import './page/bottomSheetDemo.dart';
import './page/notice.dart';
import './page/myNotice.dart';
import './page/store.dart';
import './page/webview.dart';
import './page/bus.dart';
import './page/point.dart';
import './page/drag.dart';
import './page/scale.dart';
import './page/recognizer.dart';
import './page/animation.dart';
import './page/staggerAnimation.dart';
import './page/switch.dart';
import './page/transition.dart';
import './page/transitionSimple.dart';
import './page/willPop.dart';
import './page/inherited.dart';
import './page/provider.dart';
import './page/deviceInfo.dart';
import './page/launcher.dart';
import './page/picture.dart';
import './page/vedio.dart';
import './page/connect.dart';
import './page/swiper.dart';

// 引入provider
import 'package:provider/provider.dart';
import './modle/count.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountModle countModel = new CountModle();
    return MultiProvider(
      providers: [
        //  用户信息
        ListenableProvider<CountModle>.value(value: countModel),
      ],
      child: MaterialApp(
        title: 'flutter app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/", //名为"/"的路由作为应用的home(首页)
        //注册路由表
        routes: {
          "/": (context) => Index(title: '首页'), //注册首页路由
          "/login": (context) => Login(),
          "/gesture": (context) => Gesture(),
          "/fetch": (context) => FetchData(),
          "/dialog": (context) => DialogView(),
          "/bottomSheetDemo": (context) => ShowBottomSheet(),
          "/notice": (context) => Notice(),
          "/myNotice": (context) => MyNotice(),
          "/store": (context) => StoreData(),
          "/webview": (context) => WebviewPage(),
          "/bus": (context) => BusPage(),
          "/point": (context) => Point(),
          "/drag": (context) => DragPage(),
          "/scale": (context) => ScalePage(),
          "/recognizer": (context) => RecognizerPage(),
          "/animation": (context) => AnimationPage(),
          "/stagger": (context) => Stagger(),
          "/switch": (context) => AnimatedSwitcherCounter(),
          "/transition": (context) => TransitionPage(),
          "/transitionSimple": (context) => TransitionSimple(),
          "/willPop": (context) => WillPopScopeTestRoute(),
          "/inherited": (context) => InheritedWidgetTestRoute(),
          "/provider": (context) => ProviderPage(),
          "/deviceInfo": (context) => DeviceInfoPage(),
          "/launcher": (context) => LauncherPage(),
          "/photo": (context) => ImagePickerPage(),
          "/vedio": (context) => VideoPage(),
          "/connect": (context) => NetConnectPage(),
          "/swiper": (context) => SwiperPage(),
        },
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            print(routeName);
          });
        },
      ),
    );
  }
}
