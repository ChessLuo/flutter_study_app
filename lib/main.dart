import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/common/events.dart';
import 'package:flutter_study_app/routers/application.dart';
import 'package:flutter_study_app/routers/routers.dart';
import 'package:flutter_study_app/res/colors.dart';
import 'package:flutter_study_app/ui/pages/transition_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  MyApp()  {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

  Color _primaryColor;
  StreamSubscription _colorSubscription;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //取消订阅
    _colorSubscription.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setThemeColor();
    //订阅eventbus
    _colorSubscription = eventBus.on<ThemeColorEvent>().listen((event) {
      //缓存主题色
      _cacheColor(event.colorStr);
      Color color = AppColors.getColor(event.colorStr);
      setState(() {
        _primaryColor = color;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: _primaryColor,
      ),
      home: TransitionPage(),
      onGenerateRoute: Application.router.generator,
    );
  }


  _cacheColor(String colorStr) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("themeColorStr", colorStr);
  }

  Future<String> _getCacheColor(String colorKey) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String colorStr = sp.getString(colorKey);
    return colorStr;
  }

  void _setThemeColor() async {
    String cacheColorStr = await _getCacheColor("themeColorStr");
    setState(() {
      _primaryColor = AppColors.getColor(cacheColorStr);
    });
  }

}

