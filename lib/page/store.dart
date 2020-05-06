import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreData extends StatefulWidget {
  @override
  StoreDataState createState() => StoreDataState();
}

class StoreDataState extends State<StoreData> {
  int counter = 0;
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.setState(() {
      counter = (prefs.getInt('counter') ?? 0) + 1;
    });
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地存储'),
      ),
      body: Column(
        children: <Widget>[
          Text('点击了${counter}'),
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text('点击+'),
          )
        ],
      ),
    );
  }
}
