import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/provider/color_filtered_model.dart';
import 'package:provider/provider.dart';

import 'fl_app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: ColorFilteredProvider()),
    ],
    child: MyApp(),
  ));

  if (Platform.isAndroid) {
    ///设置状态栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
