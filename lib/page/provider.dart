import 'package:flutter/material.dart';
// 引入provider
import 'package:provider/provider.dart';
import '../modle/count.dart';

class ProviderPage extends StatefulWidget {
  @override
  ProviderState createState() => new ProviderState();
}

class ProviderState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountModle>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: Column(
        children: <Widget>[
          Text('点击了${counter.count}'),
          RaisedButton(
            child: Text("点击"),
            onPressed: () {
              counter.add();
            },
          )
        ],
      ),
    );
  }
}
