import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(home: PageB());
  }
}

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("hello flutter")),
        body: const Column(
          children: [Text("flutter 测试")],
        ));
  }
}

class PageB extends StatefulWidget {
  const PageB({super.key});
  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  int _numCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("flutter home")),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$_numCount"), 
              ElevatedButton(
                onPressed: (){
                  setState((){
                    _numCount++;
                  });
                }, 
                child: Text("+1")
              )
            ],
          ),
        ) 
      );
  }
}
