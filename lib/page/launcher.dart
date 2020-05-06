import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherPage extends StatefulWidget {
  @override
  LauncherState createState() => new LauncherState();
}

class LauncherState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('url launcher'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('打开外部浏览器'),
            onPressed: () async {
              String url = 'https://www.baidu.com/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          RaisedButton(
            child: Text('拨打电话'),
            onPressed: () async {
              String tel = 'tel:10086';
              if (await canLaunch(tel)) {
                await launch(tel);
              } else {
                throw 'Could not launch $tel';
              }
            },
          ),
          RaisedButton(
            child: Text('发送短信'),
            onPressed: () async {
              String tel = 'sms:10086';
              if (await canLaunch(tel)) {
                await launch(tel);
              } else {
                throw 'Could not launch $tel';
              }
            },
          ),
          RaisedButton(
            child: Text('打开外部应用'),
            onPressed: () async {
              String app = 'weixin://';
              if (await canLaunch(app)) {
                await launch(app);
              } else {
                throw 'Could not launch $app';
              }
            },
          ),
          Text('常用url scheme：https://www.jianshu.com/p/91c24aa50ae3')
        ],
      ),
    );
  }
}
