import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FetchData extends StatefulWidget {
  @override
  FetchDataState createState() => FetchDataState();
}

class FetchDataState extends State<FetchData> {
  String message = '';
  void getHttp() async {
    try {
      Response response = await Dio().get(
        "https://auth.huijuer.com/api/auth/checklogin",
        options: Options(responseType: ResponseType.json),
      );

      this.setState(() {
        message = response.data['message']; // 注意dart中map不能用.的形式访问，必须用[]
        print(message);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据请求'),
      ),
      body: Column(
        children: <Widget>[
          Text('请求结果${this.message}'),
          RaisedButton(
            child: Text("发起请求"),
            onPressed: () async {
              await this.getHttp();
            },
          ),
        ],
      ),
    );
  }

  reflect(Response response) {}
}
