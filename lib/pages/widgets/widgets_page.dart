/**
 * @描述 flutter widgets
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2020-04-04
 *
 */
import 'package:flutter/material.dart';
class WidgetsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Widgets"),
      ),
      body: Container(
        child: Text("I am Flutter Widgets"),
      ),
    );
  }

}