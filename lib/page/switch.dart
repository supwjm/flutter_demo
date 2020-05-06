import 'package:flutter/material.dart';

class AnimatedSwitcherCounter extends StatefulWidget {
  const AnimatedSwitcherCounter({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('切换动画'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              // 新child显示动画时长
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行缩放动画
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: const Text(
                '+1',
              ),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
