
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './router_handler.dart';

class Routes {
  static String root = "/";
  static String transitionPage = "/transition";
  static String mainPage = "/main";

  static String dartPage = "/dart";

  static String apiPage = "/api";

  static String widgetsPage = "/widgets";

  static String otherListPage = "/other";
  static String sqflitePage = "/sqflite";
  static String eventBusPage = "/eventBus";
  static String fileZipPage = "/fileZip";
  static String webViewPlginPage = "/webViewPlgin";
  static String flutterWebViewPage = "/flutterWebView";
  static String providerPage = "/provider";
  static String sharedPreferences = "/sharedPreferences";
  static String flutterChannel = "/flutterChannel";
  static String urlLauncher = "/urlLauncher";

  static String aboutPage = "/about";


  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        });

    router.define(transitionPage, handler: transitionHandler);
    router.define(mainPage, handler: mainHandler);

    router.define(dartPage, handler: dartHandler);
    router.define(apiPage, handler: apiHandler);
    router.define(widgetsPage, handler: widgetsHandler);

    router.define(otherListPage, handler: otherListHandler);
    router.define(sqflitePage, handler: sqfliteHandler);
    router.define(eventBusPage, handler: eventBusHandler);
    router.define(fileZipPage, handler: fileZipHandler);
    router.define(webViewPlginPage, handler: webViewPlginHandler);
    router.define(flutterWebViewPage, handler: flutterWebViewHandler);
    router.define(providerPage, handler: providerHandler);
    router.define(sharedPreferences, handler: spHandler);
    router.define(flutterChannel, handler: channelHandler);
    router.define(urlLauncher, handler: urlLauncherHandler);

    router.define(aboutPage, handler: aboutHandler);

  }
}
