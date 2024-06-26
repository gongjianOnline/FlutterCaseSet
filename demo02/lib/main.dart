import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageApp(),
    );
  }
}

class PageApp extends StatefulWidget {
  const PageApp({super.key});

  @override
  State<PageApp> createState() => _PageAppState();
}

class _PageAppState extends State<PageApp> {
  Future<String> loadData()async{
    await Future.delayed(const Duration(seconds: 10));
    return "this is data";
  }

  Stream<int> loadStreamData(){
    return Stream.periodic(const Duration(seconds:1),(_)=>42);
  }

  @override
  void initState(){
    loadStreamData().listen((event) {
      print(event);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("表单示例")),
      body: Container(
        child: Column(
          children: [
            Container(
              child: const Text("stream流"),
            )
          ],
        ),
      ),
    );
  }
}

