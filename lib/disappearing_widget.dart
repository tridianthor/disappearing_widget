import 'package:disappearing_widget/provider/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisappearingWidget extends StatelessWidget {
  final Widget child;

  const DisappearingWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: !Provider.of<TimerProvider>(context).hideElement ? 1 : 0,
      duration: const Duration(milliseconds: 800),
      child: child,
    );
  }
}