/**
 * @描述 关于
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2020-04-04
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/toast_util.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {

  final String gitHubStr = "https://github.com/ChessLuo/flutter_study_app";

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
            Text(
                "        Flutter 是 Google 开源的 UI 工具包，能够帮助开发者通过一套代码库高效构建多平台精美应用，"
                    "并且还支持移动、Web、桌面和嵌入式平台。\n\n"
                    "        随着Flutter被越来越多的知名公司应用在自己的商业APP中，"
                    "Flutter这门新技术也逐渐进入了移动开发者的视野，"
                    "🔥勤能补拙，我希望能利用业余时间去学习及总结一些有关flutter的知识并运用到项目中去，"
                    "Come on！！！"),
            SizedBox(height: 20,),
            Text("项目地址："),
            InkWell(
              onTap: (){
                _launchURL(gitHubStr);
              },
              child: Text(gitHubStr,style: TextStyle(color: Colors.blue,fontSize: 18),),
            )
          ],
        ),
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
