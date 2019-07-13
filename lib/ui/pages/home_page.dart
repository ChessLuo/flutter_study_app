import 'package:flutter/material.dart';
import 'package:flutter_study_app/common/constant.dart';
import 'package:flutter_study_app/ui/demo/flutter_webview_demo.dart';
import 'package:flutter_study_app/ui/demo/webview_plugin_demo.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBar(
          centerTitle: true,
          title: Text('学无止境',style: TextStyle(color: Colors.white),),
        ),
        body:ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: BorderDirectional(bottom: BorderSide(color: Colors.grey))
              ),
              child: ListTile(
                title: Text(itemTitles[0]),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.of(context).pushNamed(Constant.SQFLITE_ROUTE);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: BorderDirectional(bottom: BorderSide(color: Colors.grey))
              ),
              child: ListTile(
                title: Text(itemTitles[1]),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.of(context).pushNamed(Constant.EVENTBUS_ROUTE);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: BorderDirectional(bottom: BorderSide(color: Colors.grey))
              ),
              child: ListTile(
                title: Text(itemTitles[2]),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.of(context).pushNamed(Constant.FILE_ZIP_ROUTE);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: BorderDirectional(bottom: BorderSide(color: Colors.grey))
              ),
              child: ListTile(
                title: Text(itemTitles[3]),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) =>
                          WebViewPlgin(url: "https://github.com/ChessLuo",title: "flutter_webview_plugin",)));
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: BorderDirectional(bottom: BorderSide(color: Colors.grey))
              ),
              child: ListTile(
                title: Text(itemTitles[4]),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) =>
                          FlutterWebView(url: "https://github.com/ChessLuo",barTitle: "flutter_webview",)));
                },
              ),
            ),

          ],
        )
    );
  }
}