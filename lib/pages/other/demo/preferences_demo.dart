/**
 * @描述 shared_preferences数据持久化
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019/7/29
 *
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PreferencesState();
  }

}

class _PreferencesState extends State<PreferencesDemo> {

  TextEditingController _nameController=new TextEditingController();
  TextEditingController _ageController=new TextEditingController();
  String _data = "暂无数据";

  String userNameKey = "sp_user_name_key";
  String userAgeKey = "sp_user_age_key";


  @override
  void initState() {
    super.initState();

  }


  ///增
  _add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userNameKey, '${_nameController.text}');
    prefs.setString(userAgeKey, '${_ageController.text}');

    setState(() {
      _data = "插入用户名和年龄数据成功！";
    });
  }


  ///删
  _delete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String username = prefs.get(userNameKey);
    String age = prefs.get(userAgeKey);
    if(username==null||age==null){
      setState(() {
        _data = '数据为空，暂无法执行删除';
      });
    }else{
      //KEY
      prefs.remove(userNameKey);
      prefs.remove(userAgeKey);
      //清空所有KEY
      //prefs.clear();

      setState(() {
        _data = '_delete 用户名和年龄值 成功';
      });
    }

  }

  ///改
  _update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userNameKey, '${_nameController.text}');
    prefs.setString(userAgeKey, '${_ageController.text}');

    setState(() {
      _data = "修改数据成功！";
    });
  }


  ///查全部
  _query() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.get(userNameKey);
    String age = prefs.get(userAgeKey);

    print('$username');
    print('$age');

    setState(() {
      _data = '_query 成功: username: $username age: $age';
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("shared_preferences",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text("设置进入程序默认用户名和年龄数据为空，如下将可以key-value形式对用户名和年龄进行增删改查操作",
                style: TextStyle(fontSize: 14,color: Color(0xff666666)),),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getNameInputView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getAgeInputView(),
            Padding(padding: EdgeInsets.only(top: 30)),
            _getAddBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getdeleteBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getUpdateBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getQueryBtnView(),
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(_data,style: TextStyle(color: Colors.red,fontSize: 18),)
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }


  _getNameInputView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _nameController,
      decoration: InputDecoration(
        hintText: "姓名",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  _getAgeInputView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _ageController,
      decoration: InputDecoration(
        hintText: "年龄",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  _getAddBtnView(){
    return RaisedButton(
        onPressed: (){
          if(_nameController.text==null||_nameController.text==""){
            Fluttertoast.showToast(msg: "插入数据不能为空！",backgroundColor: Colors.orange);
            return;
          }
          if(_ageController.text==null||_ageController.text==""){
            Fluttertoast.showToast(msg: "插入数据不能为空！",backgroundColor: Colors.orange);
            return;
          }
          _add();

        },
        child: Text("插入数据",style: TextStyle(color: Colors.white,fontSize: 18),),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
    );
  }

  _getdeleteBtnView(){
    return RaisedButton(
        onPressed: (){

          _delete();
        },
        child: Text("删除数据",style: TextStyle(color: Colors.white,fontSize: 18),),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
    );
  }

  _getUpdateBtnView(){
    return RaisedButton(
        onPressed: (){
          if(_nameController.text==null||_nameController.text==""){
            Fluttertoast.showToast(msg: "姓名不能为空！",backgroundColor: Colors.orange);
            return;
          }

          _update();
        },
        child: Text("修改姓名数据",style: TextStyle(color: Colors.white,fontSize: 18),),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
    );
  }

  _getQueryBtnView(){
    return RaisedButton(
        onPressed: (){
          _query();
        },
        child: Text("查询数据",style: TextStyle(color: Colors.white,fontSize: 18),),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
    );
  }

}