import 'package:flutter/material.dart';
import "./page.dart";
import "./page2.dart";
import "./page3.dart";
import "./page4.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PageB());
  }
}

class PageB extends StatefulWidget {
  const PageB({super.key});

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  Map _routerList = {
    "0":const Page1(),
    "1":const Page2(),
    "2":const Page3(),
    "3":const Page4(),
  };
  int _countIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appDemo"),
      ),
      body: _routerList["${_countIndex}"],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _countIndex,
        onTap: (index){
          print(index);
          setState(() {
            _countIndex = index;
          });
        },
        items:const [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label:"首页"
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.access_alarm),
            label:"分类"
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.access_time_filled_rounded),
            label:"购物车"
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.account_balance),
            label:"我的"
          ),
        ]
      ),
      
    );
  }
}
