import 'package:flutter/material.dart';
import 'package:disappearing_widget/disappearing_widget.dart';
import 'package:disappearing_widget/provider/timer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TimerProvider(3),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DisappearingWidgetRoot root = DisappearingWidgetRoot(
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      3);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Disappearing Widget'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  /*timerProvider.show();*/
                  Provider.of<TimerProvider>(context, listen: false).show();
                },
                child: const Text("Make appear"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: DisappearingWidget(
                timeout: 3,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
