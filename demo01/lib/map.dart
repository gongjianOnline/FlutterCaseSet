import 'package:flutter/material.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';


class MapComponent extends StatefulWidget {
  const MapComponent({super.key});

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  static const AMapApiKey amapApiKeys = AMapApiKey(
    androidKey: '019bb1dd550a1d94aeae3e1557bcd365',
    iosKey: ''
  );
  void onMapCreated(AMapController controller){
    (AMapController controller){
      print("地图创建成功");
    };
  }
  late AMapController _mapController;

  void _onMapCreated(AMapController controller) {
    _mapController = controller;
    getApprovalNumber();
  }
  /// 获取审图号
  void getApprovalNumber() async {
    //普通地图审图号
    String? mapContentApprovalNumber =
        await _mapController?.getMapContentApprovalNumber();
    //卫星地图审图号
    String? satelliteImageApprovalNumber =
        await _mapController?.getSatelliteImageApprovalNumber();
  }
  
  @override
  Widget build(BuildContext context) {
    ///在创建地图时设置apiKey属性
    AMapWidget map = AMapWidget(
      ///配置apiKey,设置为null或者不设置则优先使用native端配置的key
      apiKey: amapApiKeys,
      buildingsEnabled:true,// 是否显示3D建筑物
      compassEnabled:true, // 指南针
      scaleEnabled:true, // 比例尺
      trafficEnabled:true, //显示路况
      labelsEnabled:true, // 显示地图文字
      onMapCreated:_onMapCreated, //初始化成功的回调
    );
    return Scaffold(
      appBar: AppBar(title:const Text("flutter 地图可视化")),
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:map
      )
    );
  }
}

