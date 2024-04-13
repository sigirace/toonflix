import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const initialSecond = 1500;
  int totalSeconds = initialSecond;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      if (totalSeconds == 0) {
        totalPomodoros = totalPomodoros + 1;
        totalSeconds = initialSecond;
        onPausePressed();
      } else {
        totalSeconds = totalSeconds - 1;
      }
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String foramt(int seconds) {
    var duration = Duration(seconds: seconds);
    String timeformat = duration.toString().split(".").first.substring(2, 7);
    return timeformat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    foramt(totalSeconds),
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 89,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            Flexible(
              flex: 3,
              child: Center(
                  child: IconButton(
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                iconSize: 120,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              )),
            ),
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  topLeft: Radius.circular(50))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Pomodors',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color)),
                              Text('$totalPomodoros',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color)),
                            ],
                          )),
                    ),
                  ],
                )),
          ],
        ));
  }
}
