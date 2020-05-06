import 'package:flutter/material.dart';

class ShowBottomSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShowBottomSheetState();
  }
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  VoidCallback _showPersBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldkey.currentState.showBottomSheet((context) {
      return new Container(
        height: 300.0,
        color: Colors.greenAccent,
        child: new Center(
          child: new Text("Hi BottomSheet"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        title: new Text("showBottomSheet"),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: _showBottomSheet,
            child: new Text("showBottomSheet"),
          ),
        ],
      ),
    );
  }
}
