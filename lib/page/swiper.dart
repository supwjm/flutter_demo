import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() => new SwiperPageState();
}

class SwiperPageState extends State<SwiperPage> {
  List<Map> list = [
    {"url": "assets/huoying1.jpg"},
    {"url": "assets/huoying2.jpg"},
    {"url": "assets/huoying3.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图组件演示'),
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
        ],
      ),
    );
  }
}
