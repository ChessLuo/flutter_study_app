/**
 * @描述 这个世界不属不属于90后，只属于努力后！
 * @author ChessLuo
 * @github https://github.com/ChessLuo
 * @email superluo666@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:flutter_study_app/common/events.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventBusPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EventBusPageState();
  }

}

class _EventBusPageState extends State<EventBusPage> {

  TextEditingController _colorController=new TextEditingController();

  @override
  void initState() {
    super.initState();
    //

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("eventbus事件总线",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Center(
              child: Text("eventbus事件总线输入颜色值修改APP主题色",style: TextStyle(fontSize: 14,color: Color(0xff666666)),),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getColorInputView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getBottonView(),
          ],
        ),
      ),
    );
  }

  _getColorInputView(){
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _colorController,
      decoration: InputDecoration(
        hintText: "输入正确的颜色值,如黑色：#000000",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  _getBottonView(){
    return RaisedButton(
        onPressed: (){
          if(_colorController.text==null||_colorController.text==""){
            Fluttertoast.showToast(msg: "请输入正确的颜色值");
            return;
          }
          print(_colorController.text);
          //发送订阅消息去修改颜色
          eventBus.fire(ThemeColorEvent(_colorController.text));

        },
        child: Text("确定",style: TextStyle(color: Colors.white,fontSize: 18),),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
    );
  }


}