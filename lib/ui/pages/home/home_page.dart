/**
 * @描述 首页
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019/7/21
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_study_app/ui/pages/drawer_page.dart';
import 'package:flutter_study_app/ui/pages/home/list_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '学无止境',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: HomeList(),
      drawer: Drawer(
        child: DrawerPage(), //侧滑页面
      ),
    );
  }
}
