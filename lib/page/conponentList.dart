import 'package:flutter/material.dart';

class ConponentList extends StatefulWidget {
  @override
  ConponentListState createState() => ConponentListState();
}

class ConponentListState extends State<ConponentList>
    with SingleTickerProviderStateMixin {
  Widget ListItem(text, url, {arguments}) {
    return Container(
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(
                0xffe5e5e5,
              ),
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(url, arguments: arguments);
          },
          child: Text(
            text,
            style: TextStyle(color: Colors.blue),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('功能列表'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListItem('轮播图', '/swiper', arguments: {'name': 'ming'}),
            ListItem('表单', '/login', arguments: {'name': 'ming'}),
            ListItem('拦截返回事件', '/willPop'),
            ListItem('对话框', '/dialog'),
            ListItem('底部弹框', '/bottomSheetDemo'),
            ListItem('数据请求', '/fetch'),
            ListItem('事件通知', '/notice'),
            ListItem('自定义事件通知', '/myNotice'),
            ListItem('全局事件bus', '/bus'),
            ListItem('本地存储', '/store'),
            ListItem('InheritedWidget数据共享', '/inherited'),
            ListItem('provider数据共享', '/provider'),
            ListItem('webview', '/webview'),
            ListItem('指针事件Listener', '/point'),
            ListItem('手势', '/gesture'),
            ListItem('手势-拖拽', '/drag'),
            ListItem('手势-缩放', '/scale'),
            ListItem('手势识别器', '/recognizer'),
            ListItem('动画', '/animation'),
            ListItem('交织动画', '/stagger'),
            ListItem('切换动画', '/switch'),
            ListItem('自定义动画过度组件', '/transition'),
            ListItem('自定义动画过度组件简化', '/transitionSimple'),
            ListItem('获取设备信息', '/deviceInfo'),
            ListItem('url launcher', '/launcher'),
            ListItem('拍照', '/photo'),
            ListItem('视频', '/vedio'),
            ListItem('网络状态', '/connect'),
          ],
        ),
      ),
    );
  }
}
