/**
 * @描述 flutter Canvas与动画相关demo
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2020-04-04
 *
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/common/model/func_model.dart';
import 'package:flutter_study_app/routers/application.dart';
import 'package:flutter_study_app/routers/routers.dart';

class AnimDemoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewState();
  }
}

class _ListViewState extends State<AnimDemoList> {
  List<FuncModel> itemTitles = [
    FuncModel(name: 'CustomPaint', routePath: Routes.customPaintPage),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Canvas与动画"),
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
