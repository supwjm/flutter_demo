import 'package:flutter/material.dart';
import 'page/home.dart';
import 'page/conponentList.dart';
import 'page/mine.dart';

class Index extends StatefulWidget {
  Index({Key key, this.title}) : super(key: key);
  final String title;

  @override
  IndexState createState() => new IndexState();
}

class IndexState extends State<Index> {
  int _selectedIndex = 0;
  List _pageList = [
    new Home(),
    new ConponentList(),
    new Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageList[this._selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('我的店'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('组件'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('我的'),
          ),
        ],
        currentIndex: this._selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
