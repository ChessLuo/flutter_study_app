import 'package:flutter/material.dart';
import 'package:flutter_study_app/common/constant.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Flutter学习',style: TextStyle(color: Colors.white),),
        ),
        body:ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: BorderDirectional(bottom: BorderSide(color: Colors.grey))
              ),
              child: ListTile(
                title: Text("sqflite数据库"),
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
                title: Text("eventbus事件总线"),
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
                title: Text("文件解压缩"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.of(context).pushNamed(Constant.FILE_ZIP_ROUTE);
                },
              ),
            ),

          ],
        )
    );
  }
}