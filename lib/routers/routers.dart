import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './router_handler.dart';

class Routes {
  static String root = "/";
  static String transitionPage = "/transition";
  static String mainPage = "/main";
  static String aboutPage = "/about";

  static String dartPage = "/dart";
  static String widgetsPage = "/widgets";

  ///canvas与动画
  static String animPage = "/anim";
  static String customPaintPage = "/customPaint";

  ///状态管理
  static String statePage = "/state";
  static String providerPage = "/provider";

  ///数据库存储
  static String localCachePage = "/localCache";
  static String sqflitePage = "/sqflite";
  static String sharedPreferences = "/sharedPreferences";

  ///其他
  static String otherListPage = "/other";
  static String eventBusPage = "/eventBus";
  static String fileZipPage = "/fileZip";
  static String webViewPlginPage = "/webViewPlgin";
  static String flutterWebViewPage = "/flutterWebView";
  static String flutterChannel = "/flutterChannel";
  static String urlLauncher = "/urlLauncher";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc:
            (BuildContext context, Map<String, List<String>> params) {});

    router.define(transitionPage, handler: transitionHandler);
    router.define(mainPage, handler: mainHandler);
    router.define(aboutPage, handler: aboutHandler);

    router.define(dartPage, handler: dartHandler);
    router.define(widgetsPage, handler: widgetsHandler);

    router.define(animPage, handler: animHandler);
    router.define(customPaintPage, handler: customPaintHandler);

    router.define(statePage, handler: stateHandler);
    router.define(providerPage, handler: providerHandler);

    router.define(localCachePage, handler: localCacheHandler);
    router.define(sqflitePage, handler: sqfliteHandler);
    router.define(sharedPreferences, handler: spHandler);

    router.define(otherListPage, handler: otherListHandler);
    router.define(eventBusPage, handler: eventBusHandler);
    router.define(fileZipPage, handler: fileZipHandler);
    router.define(webViewPlginPage, handler: webViewPlginHandler);
    router.define(flutterWebViewPage, handler: flutterWebViewHandler);
    router.define(flutterChannel, handler: channelHandler);
    router.define(urlLauncher, handler: urlLauncherHandler);
  }
}
