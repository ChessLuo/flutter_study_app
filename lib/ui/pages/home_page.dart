import 'package:flutter/material.dart';
import 'package:flutter_study_app/common/constant.dart';
import 'package:flutter_study_app/ui/demo/flutter_webview_demo.dart';
import 'package:flutter_study_app/ui/demo/webview_plugin_demo.dart';
import 'package:flutter_study_app/ui/pages/drawer_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List itemTitles = [
    'sqflite数据库',
    'eventbus事件总线',
    '文件解压缩',
    'WebView（flutter_webview_plugin）',
    'WebView（flutter官方插件）',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key:_scaffoldKey,
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBar(
          centerTitle: true,
          title: Text('学无止境',style: TextStyle(color: Colors.white),),
        ),
        body:_showBody(),
      drawer: Drawer(
        child: DrawerPage(),//侧滑页面
      ),
    );
  }

  ///首页body Listview
  Widget _showBody(){
   return ListView(
     children: <Widget>[
       _listItem(itemTitles[0],(){
         Navigator.of(context).pushNamed(Constant.SQFLITE_ROUTE);
       }),

       _listItem(itemTitles[1],(){
         Navigator.of(context).pushNamed(Constant.EVENTBUS_ROUTE);
       }),

       _listItem(itemTitles[2],(){
         Navigator.of(context).pushNamed(Constant.FILE_ZIP_ROUTE);
       }),

       _listItem(itemTitles[3],(){
         Navigator.push(context,
             MaterialPageRoute(builder: (BuildContext context) =>
                 WebViewPlgin(url: "https://github.com/ChessLuo",title: "flutter_webview_plugin",)));
       }),

       _listItem(itemTitles[4],(){
         Navigator.push(context,
             MaterialPageRoute(builder: (BuildContext context) =>
                 FlutterWebView(url: "https://github.com/ChessLuo",barTitle: "flutter_webview",)));
       }),

     ],
   );
  }

  ///demo Item入口View
  Widget _listItem(String itemTitle,Function onTap){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(bottom: BorderSide(color: Colors.grey))
      ),
      child: ListTile(
        title: Text(itemTitle),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );

  }



}