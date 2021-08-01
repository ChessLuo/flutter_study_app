/**
 * @描述 flutter widgets
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2020-04-04
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_study_app/common/model/func_model.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({Key key}) : super(key: key);

  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {

   List<FuncModel> itemTitles = [
    // FuncModel(name: 'sqflite数据库', routePath: Routes.sqflitePage),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("常用Widgets"),
      ),
      body: Container(
        child: Text("I am Flutter Widgets"),
      ),
    );
  }
}
