import 'package:flutter/material.dart';
import '../util/colorUtil.dart';

ScrollController _scrollController = ScrollController();

class TabContentItem extends StatefulWidget {
  @override
  TabContentItemState createState() => TabContentItemState();
}

class TabContentItemState extends State<TabContentItem>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // 上拉加载
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        print('滑动到了最底部');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: RefreshIndicator(
        // 下拉刷新
        onRefresh: _onRefresh,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Container(
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
            );
          },
        ),
      ),
    );
  }
}

Future<void> _onRefresh() async {
  print('执行刷新');
}
