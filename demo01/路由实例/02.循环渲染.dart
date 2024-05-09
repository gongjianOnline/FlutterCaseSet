import 'package:flutter/material.dart';

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
  List<String> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("动态循环")),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                _list.add("123");
              });
            }, child: Text("添加数据")),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount:_list.length,
                itemBuilder:(content,index){
                  return Container(child: Text('${_list[index]}'));
                }
              )
            )
          ],
        ),
      ),
    );
  }
}
