import 'package:flutter/material.dart';
// 引入provider
import 'package:provider/provider.dart';
import '../modle/count.dart';

class Mine extends StatefulWidget {
  @override
  MineState createState() => new MineState();
}

class MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountModle>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('验证provider数据共享'),
      ),
      body: Column(
        children: <Widget>[
          Text('provider页面点击了：${counter.count}次'),
        ],
      ),
    );
  }
}
