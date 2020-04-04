
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppColors {
  static const Color primaryColor =  Color(0xff7C46B3);
  static const Color toastBlackBgColor = Color(0xA6000000);//可设置透明度 A6
  static const Color transparent = Color(0x00000000);

  static const Color appBlueColor = Color(0xff46B6FF);
  static const Color appBlue1Color = Color(0xff1048FF);

  static const Color grayf5f5f5 = Color(0xffd9d9d9);




  ///输入#000000颜色字符串，获取颜色对象Color
  static Color getColor(String colorStr){
    if(colorStr!=null){
      if(colorStr.substring(0,1)!="#"){
        return primaryColor;
      }
      String substring = colorStr.substring(1,colorStr.length);
      return Color(int.parse('0xff'+substring));
    }
    return primaryColor;
  }



}