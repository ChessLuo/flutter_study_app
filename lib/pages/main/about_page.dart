/**
 * @描述 关于
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2020-04-04
 *
 */
///
import 'package:flutter/material.dart';
import 'package:flutter_study_app/res/colors.dart';
import 'package:flutter_study_app/res/string_zh.dart';
import 'package:flutter_study_app/utils/toast_util.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        centerTitle: true,
        title: Text("关于"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(StringZh.appDesc),
            SizedBox(
              height: 20,
            ),
            Text("项目地址："),
            InkWell(
              onTap: () {
                _launchURL(StringZh.appAddress);
              },
              child: Text(
                StringZh.appAddress,
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.share),
        onPressed: () {
          Share.share(StringZh.appDesc+"\n\n项目地址："+StringZh.appAddress);
        },
        tooltip: "放开我，按这么长时间干嘛！！！",
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ToastUtil.showToast('Could not launch $url');
    }
  }
}
