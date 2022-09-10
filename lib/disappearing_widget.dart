import 'dart:async';
import 'dart:developer';

import 'package:disappearing_widget/provider/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisappearingWidgetRoot extends StatelessWidget {
  final Widget child;
  final int timeout;

  const DisappearingWidgetRoot(this.child, this.timeout);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TimerProvider(timeout), child: DisappearingWidget(child: child, timeout: timeout,),);
  }
}

class DisappearingWidget extends StatefulWidget {
  final Widget child;

  ///Timeout in second
  final int timeout;

  ///Widget to make the child disappear in given time
  const DisappearingWidget({Key? key, required this.child, required this.timeout}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DisappearingWidgetState();
  }
}

class DisappearingWidgetState extends State<DisappearingWidget> {
  late TimerProvider timerProvider;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Provider.of<TimerProvider>(context, listen: false).startTimer();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<TimerProvider>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: !Provider
          .of<TimerProvider>(context)
          .hideElement ? 1 : 0,
      duration: const Duration(milliseconds: 800),
      child: widget.child,
    );
  }
}
