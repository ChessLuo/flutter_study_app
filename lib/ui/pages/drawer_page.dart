/**
 * @描述 侧滑页面
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019/7/13
 *
 */
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DrawerPageState();
  }

}

class _DrawerPageState extends State<DrawerPage> {

  var itemTitles = ["主题","GitHub","关于"];
  var itemIcons = [Icons.brightness_medium,Icons.people,Icons.android];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('程序猿在广东',style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text('这个世界不属于90后，只属于努力后！',maxLines: 2,),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/logo.jpg'
              ),
            ),
            margin: EdgeInsets.zero,
          ),

          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: itemTitles.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(context,index);
                }),
          )

        ],
      ),
    );
  }

  Widget _listItem(BuildContext context, int index) {
    return Container(
      child: ListTile(
        leading: Icon(itemIcons[index]),
        title: Text(itemTitles[index]),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap:(){

        },
      ),
    );
  }

}