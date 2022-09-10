import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier{
  late int _timerStart, _timer;
  late Timer _inactivityTimer;
  bool hideElement = false;

  TimerProvider(_timerStart){
    this._timerStart = _timerStart;
    _timer = _timerStart;
  }

  startTimer() {
    log("timer started");
    const tick = Duration(seconds: 1);
    _inactivityTimer = Timer.periodic(tick, (timer) {
      if (_timer == 0) {
        _timer = _timerStart;
        _inactivityTimer.cancel();
        hideElement = !hideElement;
        notifyListeners();
      } else {
        _timer--;
      }
    });
  }

  show(){
    log("timer cancelled");

    _inactivityTimer.cancel();
    hideElement = false;

    if (!_inactivityTimer.isActive) {
      startTimer();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _inactivityTimer.cancel();
    super.dispose();
  }
}