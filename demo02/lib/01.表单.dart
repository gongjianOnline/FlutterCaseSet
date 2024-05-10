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
  String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("表单示例")),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "请输入用户名",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "请输入密码",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ), 
            ),
            TextField(
              onChanged:(value){
                setState((){
                  username = value;
                });
              },
              decoration: InputDecoration(
                hintText: "请输入关键字", 
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.close),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            Container(
              child: Text("${username}"),
            )
          ],
        ),
      ),
    );
  }
}

