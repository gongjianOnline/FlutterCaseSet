import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:permission_handler/permission_handler.dart';


class PageComponent extends StatefulWidget {
  const PageComponent({super.key});

  @override
  State<PageComponent> createState() => _PageComponentState();
}

class _PageComponentState extends State<PageComponent> {
  /**获取数据 */
  Map<String, Object>? _locationResult;
  /**监听定位 */
  StreamSubscription<Map<String, Object>>? _locationListener;
  /**实例化插件 */
  AMapFlutterLocation _locationPlugin = new AMapFlutterLocation();

  @override
  void initState() {
    super.initState();
    /// 动态申请定位权限
    requestPermission();
    /// [hasShow] 隐私权政策是否弹窗展示告知用户
    AMapFlutterLocation.updatePrivacyShow(true, true);
    /// [hasAgree] 隐私权政策是否已经取得用户同意
    AMapFlutterLocation.updatePrivacyAgree(true);
    AMapFlutterLocation.setApiKey("019bb1dd550a1d94aeae3e1557bcd365", "");
    ///注册定位结果监听
    _locationListener = _locationPlugin.onLocationChanged().listen((Map<String, Object> result) {
      setState(() {
        _locationResult = result;
      });
      print("定位开启成功 ${json.encode(result)}");
    });
  }

  /// 动态申请定位权限
  void requestPermission() async {
    // 申请权限
    bool hasLocationPermission = await requestLocationPermission();
    if (hasLocationPermission) {
      print("定位权限申请通过");
    } else {
      print("定位权限申请不通过");
    }
  }
  // 申请定位权限
  /// 授予定位权限返回true， 否则返回false
  Future<bool> requestLocationPermission() async {
    //获取当前的权限
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  // 开启定位
  void _startLocation() {
    ///开始定位之前设置定位参数
    // _setLocationOption();
    _locationPlugin.startLocation();
  }

  // 停止定位
  void _stopLocation() {
    _locationPlugin.stopLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageComponent页面")),
      body:Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){_startLocation();}, child: Text("开启定位")),
            ElevatedButton(onPressed: (){_stopLocation();}, child: Text("关闭定位")),
            Text("定位结果：${_locationResult.toString()}"),
          ],
        ),
      )
    );
  }
}