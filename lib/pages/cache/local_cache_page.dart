/**
 * @描述 数据库存储相关demo
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

class LocalCachePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewState();
  }
}

class _ListViewState extends State<LocalCachePage> {
  List<FuncModel> itemTitles = [
    FuncModel(name: 'sqflite数据库', routePath: Routes.sqflitePage),
    FuncModel(
        name: 'shared_preferences数据持久化', routePath: Routes.sharedPreferences)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("本地数据存储"),
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
          border: BorderDirectional(bottom: BorderSide(color: Colors.grey))),
      child: ListTile(
        title: Text(itemTitle),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );
  }
}
