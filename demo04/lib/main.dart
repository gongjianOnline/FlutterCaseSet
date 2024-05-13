import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

void main(){
  runApp(MyApp());
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
  @override
  void initState(){
    super.initState();
    initJpush();
  }

  //监听极光推送 (自定义的方法)
  //https://github.com/jpush/jpush-flutter-plugin/blob/master/documents/APIs.md
  initJpush() async {
    JPush jpush = new JPush();

    var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 3000);
    var localNotification = LocalNotification(
      id: 234,
      title: 'notification title',
      buildId: 1,
      content: 'notification content',
      fireTime: fireDate,
      subtitle: 'notification subtitle', // 该参数只有在 iOS 有效
      badge: 5, // 该参数只有在 iOS 有效
    );
    jpush.sendLocalNotification(localNotification).then((res) {});

    //获取注册的id
    jpush.getRegistrationID().then((rid) {
      print("获取注册的id:$rid");
    });
    //初始化
    jpush.setup(
      appKey: "93ba8df603b6f530b2310c69",
      channel: "theChannel",
      production: false,
      debug: true, // 设置是否打印 debug 日志
    );

    //设置别名  实现指定用户推送
    // jpush.setAlias("jg123").then((map) {
    //   print("设置别名成功");
    // });

    try {
      //监听消息通知
      jpush.addEventHandler(
        // 接收通知回调方法。
        onReceiveNotification: (Map<String, dynamic> message) async {
          print("flutter onReceiveNotification: $message");
        },
        // 点击通知回调方法。
        onOpenNotification: (Map<String, dynamic> message) async {
          print("flutter onOpenNotification: $message");
        },
        // 接收自定义消息回调方法。
        onReceiveMessage: (Map<String, dynamic> message) async {
          print("flutter onReceiveMessage: $message");
        },
      );
    } catch (e) {
      print('极光sdk配置异常');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("flutter推送")),
    );
  }
}