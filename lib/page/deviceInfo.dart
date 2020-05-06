import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

class DeviceInfoPage extends StatefulWidget {
  @override
  DeviceInfoState createState() => new DeviceInfoState();
}

class DeviceInfoState extends State<DeviceInfoPage> {
  String machine;
  @override
  void initState() {
    this.getInfo();
    super.initState();
  }

  void getInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        machine = iosInfo.utsname.machine;
      });
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        machine = androidInfo.model;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('获取设备信息'),
      ),
      body: Text('设备信息${machine}'),
    );
  }
}
