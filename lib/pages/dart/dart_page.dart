/**
 * @描述 dart
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2020-04-04
 *
 */
import 'package:flutter/material.dart';
class DartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dart"),
      ),
      body: Container(
        child: Text("I am Dart"),
      ),
    );
  }

}