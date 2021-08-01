import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/common/model/func_model.dart';
import 'package:flutter_study_app/res/string_zh.dart';
import 'package:flutter_study_app/routers/application.dart';
import 'package:flutter_study_app/routers/routers.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<FuncModel> itemTitles = [
    FuncModel(
        name: StringZh.dart, bgColor: Colors.red, routePath: Routes.dartPage),
    FuncModel(
        name: '常用Widget',
        bgColor: Colors.orange,
        routePath: Routes.widgetsPage),
    FuncModel(name: '状态管理', bgColor: Colors.amber, routePath: Routes.statePage),
    FuncModel(
        name: 'Canvas与动画', bgColor: Colors.green, routePath: Routes.animPage),
    FuncModel(
        name: '本地数据存储', bgColor: Colors.cyan, routePath: Routes.localCachePage),
    FuncModel(
        name: 'Flutter Channel',
        bgColor: Colors.blue,
        routePath: Routes.flutterChannel),
    FuncModel(
        name: StringZh.otherDemo,
        bgColor: Colors.purple,
        routePath: Routes.otherListPage),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: itemTitles.length,
            itemBuilder: (BuildContext context, int index) {
              return _listItem(
                  itemTitles[index].name, itemTitles[index].bgColor, () {
                Application.router.navigateTo(
                    context, itemTitles[index].routePath,
                    transition: TransitionType.inFromRight);
              });
            }));
  }

  Widget _listItem(String title, Color bgColor, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )),
    );
  }
}
