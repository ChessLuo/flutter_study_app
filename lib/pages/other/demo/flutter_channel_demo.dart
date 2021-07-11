/**
 * @描述 flultter channel与原生交互通道
 * @author chessluo
 * @email superluo666@gmail.com
 * @github https://github.com/ChessLuo
 * @date 2019-08-10
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChannelState();
  }
}

class ChannelState extends State<ChannelDemo> {
  static const platform = const MethodChannel('flutter_study_app');
  String _batteryLevel = '电池电量未知';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ///获取电池电量的channel通道方法
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Channel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('获得电池电量'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
