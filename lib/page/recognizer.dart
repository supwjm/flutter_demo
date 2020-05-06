import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class RecognizerPage extends StatefulWidget {
  @override
  GestureRecognizerState createState() => new GestureRecognizerState();
}

class GestureRecognizerState extends State<RecognizerPage> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('手势识别器'),
        ),
        body: Column(
          children: <Widget>[
            Text(
                'GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势'),
            Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(text: "你好世界"),
                TextSpan(
                  text: "点我变色",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: _toggle ? Colors.blue : Colors.red),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      setState(() {
                        _toggle = !_toggle;
                      });
                    },
                ),
                TextSpan(text: "你好世界"),
              ])),
            )
          ],
        ));
  }
}
