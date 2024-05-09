import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  String title;
  Page5({super.key,this.title="默认值"});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("跳转都按新的页面")),
      body: Text("新的页面 ${widget.title}")
    );
  }
}