import 'dart:async';

import 'package:flutter/material.dart';

class DisappearingWidget extends StatefulWidget {
  final Widget child;
  ///Timeout in second
  final int timeout;

  ///Widget to make the child disappear in given time
  const DisappearingWidget({required Key key, required this.child, required this.timeout}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DisappearingWidgetState();
  }
}

class DisappearingWidgetState extends State<DisappearingWidget> {
  late int _timerStart;
  late Timer _inactivityTimer;
  bool hidePlayButton = false;

  @override
  void initState() {
    _timerStart = widget.timeout;

    _startTimer();
    super.initState();
  }

  _startTimer() {
    const tick = Duration(seconds: 1);
    _inactivityTimer = Timer.periodic(tick, (timer) {
      if (_timerStart == 0) {
        setState(() {
          _timerStart = 3;
          _inactivityTimer.cancel();
          hidePlayButton = !hidePlayButton;
        });
      } else {
        setState(() {
          _timerStart--;
        });
      }
    });
  }

  show() {
    _inactivityTimer.cancel();
    setState(() {
      hidePlayButton = false;
    });
    if (!_inactivityTimer.isActive) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _inactivityTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: !hidePlayButton ? 1 : 0,
      duration: Duration(milliseconds: 800),
      child: widget.child,
    );
  }
}
