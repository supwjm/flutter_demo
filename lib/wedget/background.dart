import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background({ 
    Key key,
    @required String src,
    EdgeInsets padding,
    @required Widget child,
  }):super(key:key);
  
  String src;
  Widget child;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(this.src),
            fit: BoxFit.cover,
          ),
        ),
        height: 160,
        width
        padding: this.padding,
        child: this.child
      );
  }
}

