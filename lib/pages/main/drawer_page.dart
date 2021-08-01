/**
 * @描述 侧滑页面
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019/7/13
 *
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/routers/application.dart';
import 'package:flutter_study_app/routers/routers.dart';
import 'package:flutter_study_app/utils/toast_util.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              '程序猿在广东',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              '这个世界不属于90后，只属于努力后！微信搜索 程序猿在广东，了解更多',
              maxLines: 2,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
            margin: EdgeInsets.zero,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _listItem(Icon(Icons.brightness_medium), Text("主题"), () {
                  ToastUtil.showToast("功能开发中~");
                }),
                _listItem(Icon(Icons.people), Text("GitHub"), () {
                  //WebView（flutter_webview_plugin）
                  Application.router.navigateTo(
                    context,
                    '${Routes.webViewPlginPage}?url=${Uri.encodeComponent("https://github.com/ChessLuo")}&title=My GitHub',
                    transition: TransitionType.native,
                  );
                }),
                _listItem(Icon(Icons.android), Text("关于"), () {
                  Application.router.navigateTo(
                    context,
                    Routes.aboutPage,
                    transition: TransitionType.inFromRight,
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listItem(Icon leading, Widget title, onTap) {
    return Container(
      child: ListTile(
        leading: leading,
        title: title,
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );
  }
}
