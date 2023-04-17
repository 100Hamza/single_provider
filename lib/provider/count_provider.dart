import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier{
  int _count = 0;
  String _time = "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

  String get time => _time;

  int get count => _count;

  void setCount ()
  {
    _count++;
    notifyListeners();
  }

  void setTime()
  {
    _time = "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    notifyListeners();
  }

}