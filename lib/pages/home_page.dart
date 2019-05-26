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
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Flutter学习',style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(Constant.SQFLITE_ROUTE);
                },
                child: Text("sqflite数据库",style: TextStyle(fontSize: 18),),
              ),

              Padding(padding: EdgeInsets.only(top: 20)),

              RaisedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(Constant.EVENTBUS_ROUTE);
                },
                child: Text("eventbus事件总线",style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}