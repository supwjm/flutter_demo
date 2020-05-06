import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogView extends StatefulWidget {
  @override
  DialogViewState createState() => DialogViewState();
}

class DialogViewState extends State<DialogView> {
  bool withTree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("对话框1"),
            onPressed: () async {
              //弹出对话框并等待其关闭
              bool delete = await showDeleteConfirmDialog1(context);
              if (delete == null) {
                print("取消删除");
              } else {
                print("已确认删除");
                //... 删除文件
              }
            },
          ),
          RaisedButton(
            child: Text("changeLanguage"),
            onPressed: () async {
              //弹出对话框并等待其关闭
              await changeLanguage(context);
            },
          ),
          RaisedButton(
            child: Text("showListDialog"),
            onPressed: () async {
              //弹出对话框并等待其关闭
              await showListDialog(context);
            },
          ),
          RaisedButton(
            child: Text("showCustom"),
            onPressed: () async {
              //弹出对话框并等待其关闭
              await showCustom(context);
            },
          ),
          RaisedButton(
            child: Text("checkbox 状态"),
            onPressed: () async {
              bool delete = await showDeleteConfirmDialog2(context);
              if (delete == null) {
                print("取消删除");
              } else {
                print("同时删除子目录: $delete");
              }
            },
          ),
          RaisedButton(
            child: Text("显示底部菜单列表"),
            onPressed: () async {
              int type = await _showModalBottomSheet(context);
              print(type);
            },
          ),
          RaisedButton(
            child: Text("loading 对话框"),
            onPressed: () async {
              int type = await showLoadingDialog(context);
              print(type);
            },
          ),
          RaisedButton(
            child: Text("material日期弹框"),
            onPressed: () async {
              DateTime type = await _showDatePicker1(context);
              print(type);
            },
          ),
          RaisedButton(
            child: Text("cupertino日期弹框"),
            onPressed: () async {
              DateTime type = await _showDatePicker2(context);
              print(type);
            },
          ),
          RaisedButton(
            child: Text("showToast"),
            onPressed: () {
              Fluttertoast.showToast(
                msg: "This is Center Short Toast",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
          ),
          RaisedButton(
            child: Text("自定义弹窗"),
            onPressed: () async {
              _showCustomDialog2(context);
            },
          ),
        ],
      ),
    );
  }

  // 带checkbox对话框
  Future<bool> showDeleteConfirmDialog2(context) {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool value) {
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }
}

// 弹出确认对话框
Future<bool> showDeleteConfirmDialog1(context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(), // 关闭对话框
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

// 选择列表对话框
Future<void> changeLanguage(context) async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      });

  if (i != null) {
    print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
  }
}

// 列表弹窗
Future<void> showListDialog(context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
              child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          )),
        ],
      );
      //使用AlertDialog会报错
      //return AlertDialog(content: child);
      return Dialog(child: child);
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

// 显示自定义弹框
Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (
      BuildContext buildContext,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

// 自定义缩放动画
Widget _buildMaterialDialogTransitions(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

// 弹出自定义对话框
Future<bool> showCustom(context) {
  return showCustomDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              // 执行删除操作
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

// 弹出底部菜单列表模态对话框
Future<int> _showModalBottomSheet(context) {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}

Future showLoadingDialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    },
  );
}

Future<DateTime> _showDatePicker1(context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add(
      //未来30天可选
      Duration(days: 30),
    ),
  );
}

Future<DateTime> _showDatePicker2(context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
    context: context,
    builder: (ctx) {
      return SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: date,
          maximumDate: date.add(
            Duration(days: 30),
          ),
          maximumYear: date.year + 1,
          onDateTimeChanged: (DateTime value) {
            print(value);
          },
        ),
      );
    },
  );
}

Future<DateTime> _showCustomDialog2(context) {
  String text = '正在获取详情...';
  return showDialog<Null>(
    context: context, //BuildContext对象
    barrierDismissible: false,
    builder: (BuildContext context) {
      return LoadingDialog(text);
    },
  );
}

class LoadingDialog extends Dialog {
  final String text;
  LoadingDialog(this.text);

  @override
  Widget build(BuildContext context) {
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text("关于我们"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Column(
                children: <Widget>[
                  Container(
                    height: 40,
                    child: Text(this.text),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
