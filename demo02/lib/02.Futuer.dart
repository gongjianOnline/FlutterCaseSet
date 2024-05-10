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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("表单示例")),
      body: Container(
        child: Column(
          children: [
            Container(
              child: FutureBuilder(
                future: loadData(),
                builder:(context,snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                      return Text("错误： ${snapshot.error}");
                    }else{
                      return Text("成功: ${snapshot.data}");
                    }
                  }else{
                    return Text("加载中。。。");
                  }
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}

