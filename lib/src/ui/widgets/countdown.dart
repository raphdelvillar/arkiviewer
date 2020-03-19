import 'package:flutter/material.dart';
import 'dart:async';

GlobalKey<CountdownState> countdownKey = GlobalKey(); 

class Countdown extends StatefulWidget {
  final int start;
  final dynamic navigate;

  Countdown({Key key, this.start, this.navigate}): super(key: key);

  @override
  CountdownState createState() => CountdownState();
}

class CountdownState extends State<Countdown> {
  int cd;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  _startTimer() {
    cd = widget.start;
    const duration = const Duration(seconds: 1);
    timer = Timer.periodic(
      duration,
      (Timer timer) =>
      setState(() {
        if (cd < 1) {
          cd = widget.start + 2;
          widget.navigate(0);
        } else {
          cd--;
        }
      })
    );
  }

  void reset() {
    setState(() => cd = widget.start + 2);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.timer, color: Colors.grey),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text('$cd s', style: TextStyle(fontSize:  15, fontWeight: FontWeight.bold, color: Colors.grey))
        )
      ]
    );
  }
}