import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/transition_page.dart';
import 'package:flutter_study_app/provider/color_filtered_model.dart';
import 'package:flutter_study_app/res/colors.dart';
import 'package:flutter_study_app/routers/application.dart';
import 'package:flutter_study_app/routers/routers.dart';
import 'package:flutter_study_app/utils/object_util.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/events.dart';

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Color _primaryColor;
  StreamSubscription _colorSubscription;

  @override
  void dispose() {
    super.dispose();
    //取消订阅
    _colorSubscription.cancel();
  }

  @override
  void initState() {
    super.initState();
    _setThemeColor();
    //订阅eventbus
    _colorSubscription = eventBus.on<ThemeColorEvent>().listen((event) {
      try {
        Color color = AppColors.getColor(event.colorStr);
        setState(() {
          _primaryColor = color;
        });
        //缓存主题色
        _cacheColor(event.colorStr);
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorFilteredProvider>(
      builder: (BuildContext context, colorFiltered, Widget child) {
        return ColorFiltered(
          colorFilter:
              ColorFilter.mode(colorFiltered.currentColor, BlendMode.color),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primaryColor: _primaryColor,
                //跟随iOS风格的主题
                platform: TargetPlatform.iOS,
                splashColor: Colors.transparent),
            home: TransitionPage(),
            onGenerateRoute: Application.router.generator,
          ),
        );
      },
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
    if (ObjectUtil.isNotEmpty(cacheColorStr)) {
      setState(() {
        _primaryColor = AppColors.getColor(cacheColorStr);
      });
    }
  }
}
