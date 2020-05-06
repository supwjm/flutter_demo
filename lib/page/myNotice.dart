import 'package:flutter/material.dart';

class MyNotice extends StatefulWidget {
  @override
  MyNoticetate createState() {
    return new MyNoticetate();
  }
}

class MyNoticetate extends State<MyNotice> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('功能列表'),
        ),
        body: NotificationListener<MyNotification>(
          onNotification: (notification) {
            setState(() {
              _msg = notification.msg;
            });
            return true; // 阻止冒泡
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      //按钮点击时分发通知
                      onPressed: () => MyNotification("Hi").dispatch(context),
                      child: Text("发送自定义事件"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
        ));
  }
}

// 自定义事件
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
