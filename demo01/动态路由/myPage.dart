import 'package:flutter/material.dart';

class MyPageA extends StatefulWidget {
  const MyPageA({super.key});

  @override
  State<MyPageA> createState() => _MyPageAState();
}

class _MyPageAState extends State<MyPageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("我的"),),
      body: Container(
        child: const Text("xxx"),
      ),
    );
  }
}