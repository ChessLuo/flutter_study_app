
/**
 * @描述 创建provider 数据模型,颜色过滤，变灰
 *
 * 这里的 Model 实际上就是我们的状态，
 * 它不仅储存了我们的数据模型，而且还包含了更改数据的方法，并暴露出它想要暴露出的数据
 *
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019/4/4
 *
 */

import 'package:flutter/material.dart';


class ColorFilteredProvider with ChangeNotifier {

  Color _colorFiltered  = Colors.transparent;//默认透明

  get currentColor => _colorFiltered;  //获取当前过滤后颜色

  ///设置过滤后的颜色
  void currColorFiltered(Color color) {
    _colorFiltered = color;
    notifyListeners();
  }
}