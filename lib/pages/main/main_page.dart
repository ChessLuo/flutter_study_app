/**
 * @描述 主页
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019/7/21
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/drawer/drawer_page.dart';
import 'package:flutter_study_app/pages/home/home_page.dart';
import 'package:flutter_study_app/res/colors.dart';
import 'package:flutter_study_app/utils/toast_util.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
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
      body: HomePage(),
      drawer: Drawer(
        child: DrawerPage(), //侧滑页面
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.share),
        onPressed: () {
          ToastUtil.showToast("功能开发中~");
        },
        tooltip: "放开我，按这么长时间干嘛！！！",
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
