/**
 * @描述 创建provider 数据模型
 *
 * 这里的 Model 实际上就是我们的状态，
 * 它不仅储存了我们的数据模型，而且还包含了更改数据的方法，并暴露出它想要暴露出的数据
 *
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019/7/23
 *
 */
import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
