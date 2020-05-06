import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class NetConnectPage extends StatefulWidget {
  @override
  NetConnectPageState createState() => new NetConnectPageState();
}

class NetConnectPageState extends State<NetConnectPage> {
  String _state;
  var subscription;

  @override
  void initState() {
    this.check();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  check() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        setState(() {
          _state = "手机网络";
        });
      } else if (result == ConnectivityResult.wifi) {
        setState(() {
          _state = "wifi 网络";
        });
      } else {
        setState(() {
          _state = "没有网络";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络'),
      ),
      body: Text('网络状态：${_state}'),
    );
  }
}
