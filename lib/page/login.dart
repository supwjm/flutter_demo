import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // 路由参数
    var args = ModalRoute.of(context).settings.arguments;
    print(args);

    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Image.asset(
                  "assets/logo.jpg",
                  width: 60.0,
                ),
              ),
              Form(
                key: _formKey,
                autovalidate: false,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _unameController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person),
                      ),
                      // 校验用户名
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      //校验密码
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.yellow[700],
                highlightColor: Colors.yellow[400],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  child: Text("登录"),
                ),
                onPressed: () {
                  print(_unameController.text);
                  print(_passwordController.text);
                  if ((_formKey.currentState as FormState).validate()) {
                    //验证通过提交数据
                  }
                },
              ),
            ],
          )),
    );
  }
}
