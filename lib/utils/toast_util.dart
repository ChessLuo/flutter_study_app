/**
 * @描述 toast工具类
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2020-04-04
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_study_app/res/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  ///toast可设置背景颜色默认背景黑色半透明，其他默认
  static void showToast(String msg,
      {Color color = AppColors.toastBlackBgColor,
      int timeInSecForIos = 1,
      Toast toastLength = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: toastLength,
        timeInSecForIos: timeInSecForIos,
        backgroundColor: color);
  }
}
