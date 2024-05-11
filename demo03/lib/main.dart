import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';


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

  final LocalAuthentication auth = LocalAuthentication();
  
  // @override
  // Future<void> initState() async {
  //   super.initState();
  //   bool? _canCheckBiometrics  = await auth.canCheckBiometrics;
  //   print("是否支持生物认证 ${_canCheckBiometrics}");
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("flutter生物认证")),
      body: Container(
        child:Column(
          children: [
            ElevatedButton(onPressed:()async{
              bool? canCheckBiometrics  = await auth.canCheckBiometrics;
              print("是否支持生物认证 ${canCheckBiometrics}");
            },
            child: const Text("生物认证")),
            ElevatedButton(onPressed:()async{
              List<BiometricType> listData  = await auth.getAvailableBiometrics();
              print("打印生物列表 ${listData}");
            },
            child: const Text("打印生物列表")),
            ElevatedButton(onPressed:()async{
              /**启动指纹认证 */
              final bool didAuthenticate = await auth.authenticate(
                localizedReason: '指纹验证',
                authMessages:const <AuthMessages>[
                  /**字段国际化 */
                  AndroidAuthMessages(
                    signInTitle: '指纹认证模块', /**图标大小：在对话框中显示为标题的消息，指示用户 */
                    biometricHint:"请将手指放到识别器内", /*提示消息，建议用户如何使用生物特征进行身份验证。*/
                    biometricNotRecognized:"指纹不匹配", /**消息，让用户知道身份验证失败。 */
                    biometricRequiredTitle:"尚未在其设备上设置生物特征验证", /**图标大小：在对话框中显示为标题的消息，指示用户 */
                    biometricSuccess:"身份验证成功",/**消息，让用户知道身份验证已成功。 */
                    cancelButton: '取消', /**显示在按钮上的消息，用户可以单击该按钮离开*/
                    deviceCredentialsRequiredTitle:"在对话框中显示未标题信息", /**在对话框中显示为标题的消息，指示用户 */
                    deviceCredentialsSetupDescription:"设置", /**建议用户转到设置和配置的消息 */
                    goToSettingsButton:"进入设置",/**按钮上显示的消息，用户可以单击该按钮进入设置页面 */
                    goToSettingsDescription:"请转到系统设置",/**建议用户转到设置和配置的消息 */
                  ),
                ]

              );
              print("识别结果 ${didAuthenticate}");
            },
            child: const Text("指纹识别"))
          ],
          
        )
      ),
    );
  }
}



