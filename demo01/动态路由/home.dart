import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("首页")),
      body:Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context,"/myPageA");
              }, 
              child: const Text("首页")
            )
          ],
        ),
      )
    );
  }
}



