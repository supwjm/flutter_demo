import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  AnimationPageState createState() => new AnimationPageState();
}

class AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);

    // 监听状态变化
    animation.addStatusListener((status) {
      print(status);
    });
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: GrowTransition(
        child: Image.asset(
          "assets/huoying.jpg",
        ),
        animation: animation,
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

// 独立出组件方便复用。
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      // 独立出渲染过程，缩小渲染范围
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child),
    );
  }
}
