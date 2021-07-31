/**
 * @描述 flutter api
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2020-04-04
 *
 */
import 'package:flutter/material.dart';

class AnimPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Canvas与动画"),
      ),
      body: Container(
        child: Text("I am Flutter AnimPage"),
      ),
    );
  }
}
