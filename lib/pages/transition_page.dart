import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/routers/application.dart';
import 'package:flutter_study_app/routers/routers.dart';
/**
 * <pre>
 *     author: ChessLuo
 *     email superluo666@gmail.com
 *     desc  : 启动页动画
 * </pre>
 */
///
class TransitionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TransitionPageState();
  }
}

class TransitionPageState extends State<TransitionPage>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, toHome);
  }

  void toHome() {
//    Navigator.of(context).pushReplacementNamed(Constant.HOME_PAGE);
    Application.router.navigateTo(context, Routes.mainPage,
        replace: true, transition: TransitionType.inFromRight);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: Text(
                  "程序猿在广东",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/logo.jpg',
                width: animation.value<=0?15:animation.value * 150,
                height: animation.value<=0?15:animation.value * 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
