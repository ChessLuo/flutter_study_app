import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_study_app/pages/anim/anim_page.dart';
import 'package:flutter_study_app/pages/anim/basis_canvas_page.dart';
import 'package:flutter_study_app/pages/cache/local_cache_page.dart';
import 'package:flutter_study_app/pages/dart/dart_page.dart';
import 'package:flutter_study_app/pages/main/about_page.dart';
import 'package:flutter_study_app/pages/main/main_page.dart';
import 'package:flutter_study_app/pages/other/demo/event_bus_demo.dart';
import 'package:flutter_study_app/pages/other/demo/file_zip_demo.dart';
import 'package:flutter_study_app/pages/channel/flutter_channel_demo.dart';
import 'package:flutter_study_app/pages/other/demo/flutter_webview_demo.dart';
import 'package:flutter_study_app/pages/cache/demo/preferences_demo.dart';
import 'package:flutter_study_app/pages/cache/demo/sqflite_demo.dart';
import 'package:flutter_study_app/pages/other/demo/url_launcher_demo.dart';
import 'package:flutter_study_app/pages/other/demo/webview_plugin_demo.dart';
import 'package:flutter_study_app/pages/other/other_page.dart';
import 'package:flutter_study_app/pages/state/provider_demo/provider_demo.dart';
import 'package:flutter_study_app/pages/state/state_page.dart';
import 'package:flutter_study_app/pages/transition_page.dart';
import 'package:flutter_study_app/pages/widgets/widgets_page.dart';

///欢迎页面
var transitionHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return TransitionPage();
  },
);

/// app的主页
var mainHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MainPage();
  },
);

/// flutter dart
var dartHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return DartPage();
  },
);

/// flutter widgets
var widgetsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return WidgetsPage();
  },
);

/// flutter 动画
var animHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return AnimDemoList();
  },
);

var customPaintHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CustomPaintPage();
  },
);


///provider状态管理
var stateHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return StateDemoList();
});
var providerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ProviderDemoPage();
});

/// flutter数据存储
var localCacheHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LocalCachePage();
  },
);

var sqfliteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SqflitePage();
  },
);

var spHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PreferencesDemo();
});

/// 其他demo列表页
var otherListHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return OtherDemoList();
  },
);

/// eventbus事件总线
var eventBusHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return EventBusPage();
  },
);

/// 文件解压缩
var fileZipHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FileZipDemo();
  },
);

///WebView（flutter_webview_plugin）
var webViewPlginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String url = params['url']?.first;
  String title = params['title']?.first;
  return WebViewPlgin(
    url: url,
    title: title,
  );
});

///WebView（flutter官方插件）
var flutterWebViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String url = params['url']?.first;
  String title = params['title']?.first;
  return FlutterWebView(
    url: url,
    barTitle: title,
  );
});

///flutter channel
var channelHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ChannelDemo();
});

///urlLauncher
var urlLauncherHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return UrlLauncherDemo();
});

///关于
var aboutHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AboutPage();
});
