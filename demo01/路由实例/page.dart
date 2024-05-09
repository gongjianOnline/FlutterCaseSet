import 'package:flutter/material.dart';
import "./page5.dart";

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                return Page5(title:"路由传参");
              })
            );
          }, child: const Text("首页"))
        ],
      ),
    );
  }
}