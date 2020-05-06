import 'package:flutter/material.dart';

class TransitionSimple extends StatefulWidget {
  @override
  TransitionPageState createState() => TransitionPageState();
}

// 调用自定义过渡组件示例代码
class TransitionPageState extends State<TransitionSimple> {
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: AnimatedDecoratedBox(
        duration: duration,
        decoration: BoxDecoration(color: _decorationColor),
        child: FlatButton(
          onPressed: () {
            setState(() {
              _decorationColor = Colors.red;
            });
          },
          child: Text(
            "点击变色",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// 跟继承普通的stateful类差不多
class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear, //动画曲线
    @required Duration duration, // 正向动画执行时长
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

// 相关的改变逻辑都封装在AnimatedWidgetBaseState
class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration; //定义一个Tween

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  /*
  Tween visitor(
    Tween<dynamic> tween, //当前的tween，第一次调用为null
    dynamic targetValue, // 终止状态
    TweenConstructor<dynamic> constructor，//Tween构造器，在上述三种情况下会被调用以更新tween
  );
  */

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(
      _decoration,
      widget.decoration,
      (value) => DecorationTween(begin: value),
    );
  }
}
