import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: const Text("分类"))
        ],
      ),
    );
  }
}