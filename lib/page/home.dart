import 'package:flutter/material.dart';
import '../util/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './tabContentItem.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["科创服务", "商标交易", "专利交易", "基础服务"];

  // 头部
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Text(
                      '汇桔网的店铺',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: ScreenUtil().setWidth(105),
                      height: ScreenUtil().setHeight(27),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/level.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {},
                          textColor: ColorUtil.fromHex('#F96600'),
                          color: Colors.white, //按钮背景颜色
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                              width: ScreenUtil().setWidth(76),
                              height: ScreenUtil().setHeight(16),
                              alignment: Alignment.center,
                              child: Text(
                                '分享店铺',
                                style: TextStyle(
                                  color: ColorUtil.fromHex('#F96600'),
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                )),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child:
                            Icon(Icons.thumb_up, size: 14, color: Colors.white),
                      ),
                      Text('实名认证',
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child:
                            Icon(Icons.thumb_up, size: 14, color: Colors.white),
                      ),
                      Text(
                        '交易保障',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child:
                            Icon(Icons.thumb_up, size: 14, color: Colors.white),
                      ),
                      Text(
                        '正规发票',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
            TabBar(
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
              indicatorColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget tabViews() {
    return TabBarView(
      controller: _tabController,
      children: tabs.map((e) {
        //创建3个Tab页
        return TabContentItem();
      }).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    return Column(
      children: <Widget>[
        header(),
        Expanded(
          flex: 1,
          child: tabViews(),
        ),
      ],
    );
  }
}
