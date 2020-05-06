import 'package:flutter/material.dart';

class ScalePage extends StatefulWidget {
  @override
  ScaleState createState() => new ScaleState();
}

class ScaleState extends State<ScalePage> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('缩放'),
      ),
      body: Center(
        child: GestureDetector(
          //指定宽度，高度自适应
          child: Image.asset("assets/huoying.jpg", width: _width),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              _width = 200 * details.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}
