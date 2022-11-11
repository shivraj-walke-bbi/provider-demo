import 'package:flutter/foundation.dart';

class CountSProvider with ChangeNotifier{



  int _count = 0;
  int get counts => _count;

  void incrementCount(){
    debugPrint("$_count++");
    _count++;
    notifyListeners();
  }

  void decrementCount(){
    debugPrint("$_count--");
    _count--;
    notifyListeners();
  }
}