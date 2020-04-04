import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/routers/application.dart';
import 'package:flutter_study_app/routers/routers.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          _listItem("Dart", Colors.orange, () {
            Application.router.navigateTo(context, Routes.dartPage,
                transition: TransitionType.inFromRight);
          }),
          _listItem("Widgets", Colors.cyan, () {
            Application.router.navigateTo(context, Routes.widgetsPage,
                transition: TransitionType.inFromRight);
          }),
          _listItem("Api", Colors.deepOrangeAccent, () {
            Application.router.navigateTo(context, Routes.apiPage,
                transition: TransitionType.inFromRight);
          }),
          _listItem("Other Demo", Colors.greenAccent, () {
            //其他demo列表页
            Application.router.navigateTo(context, Routes.otherListPage,
                transition: TransitionType.inFromRight);
          }),
        ],
      ),
    );
  }

  Widget _listItem(String title, Color bgColor, onTap) {
    return InkWell(
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
              fontSize: 20,
            ),
          )),
    );
  }
}
