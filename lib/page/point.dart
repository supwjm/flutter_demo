import 'package:flutter/material.dart';

class Point extends StatefulWidget {
  const Point({
    Key key,
  }) : super(key: key);

  @override
  PointState createState() => PointState();
}

class PointState extends State<Point> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('指针事件'),
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.red)),
                  ),
                  onPointerDown: (event) => print("红色背景被点击"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                  ),
                  onPointerDown: (event) => print("文本区域被点击"),
                  behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
                )
              ],
            ),
            // 忽略指针事件，如果用IgnorePointer，up也不会输出
            Listener(
              child: AbsorbPointer(
                child: Listener(
                  child: Container(
                    color: Colors.blue,
                    width: 200.0,
                    height: 100.0,
                  ),
                  onPointerDown: (event) => print("in"),
                ),
              ),
              onPointerDown: (event) => print("up"),
            )
          ],
        ));
  }
}
