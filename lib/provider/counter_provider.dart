import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier
{
  // Instances
  int _count = 0;
  String _time = "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

  // Getter Functions
  int get getCount => _count;
  String get getTime => _time;

  //Setter Functions
  void setCount()
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