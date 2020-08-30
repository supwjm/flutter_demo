import 'package:flutter/material.dart';
// 引入provider
import 'package:provider/provider.dart';
import '../modle/count.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../util/colorUtil.dart';

class Mine extends StatefulWidget {
  @override
  MineState createState() => new MineState();
}

class MineState extends State<Mine> with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List<Map> list = [
    {"url": "assets/huoying1.jpg"},
    {"url": "assets/huoying2.jpg"},
    {"url": "assets/huoying3.jpg"},
  ];

  List tabs = ["科创服务", "商标交易"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountModle>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('验证provider数据共享'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    this.list[index]["url"],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: list.length,
                pagination: new SwiperPagination(),
                autoplay: true,
                // control: new SwiperControl(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 132,
                  height: 132,
                  margin: EdgeInsets.only(right: 17),
                  child: Image.asset(
                    "assets/product.png",
                    width: 132,
                    height: 132,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "科技宝A版",
                        style: TextStyle(
                          color: ColorUtil.fromHex('#333333'),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "交付4项科技项目，不限服务周期，若申报项目未立项，可更替项目",
                        maxLines: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '\$9800',
                            style: TextStyle(
                              color: ColorUtil.fromHex('#F96600'),
                            ),
                          ),
                          FlatButton.icon(
                            icon: Icon(
                              Icons.info,
                              size: 16,
                              color: ColorUtil.fromHex('#F96600'),
                            ),
                            label: Text(
                              "分享",
                              style: TextStyle(
                                color: ColorUtil.fromHex('#F96600'),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: TabBar(
              controller: _tabController,
              tabs: tabs
                  .map((e) => Tab(
                        child: Text(e, style: TextStyle(color: Colors.black)),
                      ))
                  .toList(),
              indicatorColor: Colors.blue,
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((e) {
                //创建3个Tab页
                return Text('tabview: ${e}');
              }).toList(),
            ),
          ),
          Text('provider页面点击了：${counter.count}次'),
        ],
      ),
    );
  }
}
