/**
 * @描述 其他demo列表
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019-11-03
 *
 */
///
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/common/model/func_model.dart';
import 'package:flutter_study_app/routers/application.dart';
import 'package:flutter_study_app/routers/routers.dart';

class OtherDemoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewState();
  }
}

class _ListViewState extends State<OtherDemoList> {
  List<FuncModel> itemTitles = [
    FuncModel(name: 'eventbus事件总线', routePath: Routes.eventBusPage),
    FuncModel(name: '文件解压缩', routePath: Routes.fileZipPage),
    FuncModel(
        name: 'WebView（flutter_webview_plugin）',
        routePath:
            '${Routes.webViewPlginPage}?url=${Uri.encodeComponent("https://github.com/ChessLuo")}&title=flutter_webview_plugin'),
    FuncModel(
        name: 'WebView（flutter官方插件）',
        routePath:
            '${Routes.flutterWebViewPage}?url=${Uri.encodeComponent("https://github.com/ChessLuo")}&title=flutter_webview'),
    FuncModel(name: 'url_launcher', routePath: Routes.urlLauncher),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("其他Demo"),
      ),
      body: ListView.builder(
          itemCount: itemTitles.length,
          itemBuilder: (BuildContext context, int index) {
            return _listItem(itemTitles[index].name, () {
              Application.router.navigateTo(
                  context, itemTitles[index].routePath,
                  transition: TransitionType.inFromRight);
            });
          }),
    );
  }

  ///demo Item入口View
  Widget _listItem(String itemTitle, Function onTap) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(
              bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: ListTile(
        title: Text(itemTitle),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );
  }
}
