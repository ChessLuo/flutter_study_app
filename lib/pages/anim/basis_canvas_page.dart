import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomPaintPage extends StatefulWidget {
  const CustomPaintPage({Key key}) : super(key: key);

  @override
  _CustomPaintPageState createState() => _CustomPaintPageState();
}


class _CustomPaintPageState extends State<CustomPaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("绘图"),
        ),
        body: Container(
          child: Container(
            // color: Colors.amberAccent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: RepaintBoundary(
              child: CustomPaint(
                //使用CustomPaint盛放画布
                painter: BasisCustomPainter(),
              ),
            ),
          ),
        ));
  }
}

class BasisCustomPainter extends CustomPainter {
  Paint _paint;
  Paint _linePaint;
  Paint _pathPaint;
  var _radius = 30.0; //小球半径
  Path _path = Path(); //画笔对象
  BasisCustomPainter() {
    _paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    _pathPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle
          .fill //Paint.style，还可以设置为PaintingStyle.fill,填充了，PaintingStyle.stroke
      ..strokeWidth = 5;
  }

  //// 绘制自定义的效果
  ///paint通过canvas绘制，size为当前控件的大小
  @override
  void paint(Canvas canvas, Size size) {
    //PointMode有3种模式：
    //points：点
    //lines：将2个点绘制为线段，如果点的个数为奇数，最后一个点将会被忽略
    //polygon：将整个点绘制为一条线

    //点，Offset为坐标向量
    List<Offset> points = [
      Offset(10, 100),
      Offset(size.width / 2 - 50, size.height / 2 + 50),
      Offset(size.width - 100, size.height - 80),
    ];

    canvas.drawPoints(PointMode.points, points, _paint);
    //线
    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), _paint);

    var _path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    //裁剪由线围成区域
    // canvas.clipPath(_path);
    //绘制路径
    canvas.drawPath(_path, _pathPaint);
    //绘制圆形
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), _radius, _paint);
    //绘制椭圆
    canvas.drawOval(Rect.fromLTRB(0, 0, size.width, size.height / 2), _paint);
    //文字
    ParagraphBuilder pb = ParagraphBuilder(ParagraphStyle(
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 18,
    ))
      // ..pushStyle(TextStyle(color: Colors.black))
      ..pushStyle(ui.TextStyle(color: Colors.amberAccent))
      ..addText(
          'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。');
    ParagraphConstraints pc = ParagraphConstraints(width: size.width - 60);
    Paragraph paragraph = pb.build()..layout(pc);
    canvas.drawParagraph(paragraph, Offset(30, 30));
    //绘制阴影
    //drawShadow 用于绘制阴影，第一个参数为绘制一个图形 Path，第二个设置阴影颜色，
    //第三个为阴影范围，最后一个阴影范围是否填充满
    canvas.drawShadow(_path, Colors.blue, 3, false);
    //绘制图片
    // canvas.drawImage(image, offset, paint);
    // canvas.drawImageRect(image, src, dst, paint);
    // canvas.drawImageNine(image, center, dst, paint);
    //绘制圆角矩形
    canvas.drawRRect(
        RRect.fromLTRBR(10, 10, 200, 200, Radius.circular(10)), _paint);
    //裁剪矩形
    //clipRect 可以在规定的矩形内进行绘制，超出范围不绘制
    // canvas.clipRect(Rect.fromLTWH(30, 100, size.width / 0.3 - 60, 300),
    //     doAntiAlias: false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    //当前实例和旧实例属性是否一致
    return false;
  }
}
