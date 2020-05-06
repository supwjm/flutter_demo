import 'package:flutter/material.dart';

class TransitionPage extends StatefulWidget {
  @override
  TransitionPageState createState() => TransitionPageState();
}

// 调用自定义过渡组件示例代码
class TransitionPageState extends State<TransitionPage> {
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: AnimatedDecoratedBox1(
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

// 自定义动画过渡组件（自己管理controller的组件）
class AnimatedDecoratedBox1 extends StatefulWidget {
  AnimatedDecoratedBox1({
    Key key,
    @required this.decoration,
    this.child,
    this.curve = Curves.linear,
    @required this.duration,
    this.reverseDuration,
  });

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
    with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;
  AnimationController _controller;

  Animation<double> get animation => _animation;
  Animation<double> _animation;

  DecorationTween _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null)
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    else
      _animation = _controller;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  // 属性更新的时候执行相关更新操作。
  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) _updateCurve();
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;
      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
