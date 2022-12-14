import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier{
  late int _timerStart;
  late Timer _inactivityTimer;
  bool hideElement = false;

  TimerProvider(_timerStart){
    this._timerStart = _timerStart;
  }

  show(){
    hideElement = false;
    notifyListeners();

    hide();
  }

  hide(){
    Future.delayed(Duration(seconds: _timerStart), (){
      hideElement = true;

      notifyListeners();
    });
  }

}