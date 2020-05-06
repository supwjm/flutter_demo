import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class UserLoggedInEvent {
  String user;

  UserLoggedInEvent(this.user);
}

class BusPage extends StatefulWidget {
  const BusPage({
    Key key,
  }) : super(key: key);

  @override
  _BusPageState createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {
  var subscription;

  void initState() {
    super.initState();
    subscription = eventBus.on<UserLoggedInEvent>().listen((event) {
      print(event.user);
    });
  }

  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全局事件bus'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("触发事件"),
            onPressed: () {
              eventBus.fire(UserLoggedInEvent('ming点击了按钮'));
            },
          )
        ],
      ),
    );
  }
}
