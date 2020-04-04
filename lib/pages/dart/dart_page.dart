import 'package:flutter/material.dart';
class DartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Dart"),
      ),
      body: Container(
        child: Text("I am Flutter Dart"),
      ),
    );
  }

}