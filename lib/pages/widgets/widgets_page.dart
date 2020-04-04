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