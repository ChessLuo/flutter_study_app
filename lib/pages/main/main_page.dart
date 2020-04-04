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
import 'package:flutter_study_app/provider/color_filtered_model.dart';
import 'package:flutter_study_app/res/colors.dart';
import 'package:flutter_study_app/utils/toast_util.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String actionTxt = "变灰";

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
        actions: <Widget>[
          InkWell(
            onTap: (){
              var filteredProvider = Provider.of<ColorFilteredProvider>(context);
              if(filteredProvider.currentColor==Colors.transparent){
                actionTxt = "切回";
                filteredProvider.currColorFiltered(Colors.grey);
              }else{
                actionTxt = "变灰";
                filteredProvider.currColorFiltered(Colors.transparent);
              }

            },
            child: Container(
              margin: EdgeInsets.only(right: 16),
              alignment: Alignment.center,
              child: Text(actionTxt),
            ),
          )
        ],
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
